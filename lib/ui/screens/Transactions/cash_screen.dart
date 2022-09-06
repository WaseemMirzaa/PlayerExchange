import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/home_screen_controller.dart';
import 'package:player_exchange/models/transactions/transaction_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/stripe/WebViewApp.dart';
import 'package:player_exchange/stripe/response/create_customer/CreateStripeAccount.dart';
import 'package:player_exchange/stripe/stripe_payment.dart';
import 'package:player_exchange/ui/screens/Transactions/cash_deposit_screen.dart';
import 'package:player_exchange/ui/screens/Transactions/cash_withdraw_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/style_manager.dart';

class CashScreen extends StatefulWidget {
  const CashScreen({Key? key}) : super(key: key);

  @override
  _CashScreenState createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {

  RxDouble totalCashout = 0.0.obs;
  AppDrawerController appDrawerController = Get.find();
  HomeScreenController homeScreenController = Get.find();

  @override
  void initState() {
    getTransactions();

  }

  Future<void> getUserData() async {
    await homeScreenController.getUserData();
  }

  Future<void> getTransactions() async {

    totalCashout.value = 0;
    var transactionsList = await APIRequests.doApi_getTransactions(userId: appDrawerController.user.value.id ?? "");
    for(TransactionModel transactionModel in transactionsList){
      totalCashout.value += transactionModel.type == TransactionConstants.TRANSACTION_TYPE_WITHDRAW ? transactionModel.amount ?? 0 : 0;
    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cash',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),
            SizedBox(
              height: 10.h,
            ),
             Text('\$${appDrawerController.user.value.walletAmount}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),
            SizedBox(
              height: 10.h,
            ),
            const Text('Cash represents the total account balance which can be used to purchase or withdraw.',
                style: TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(
              height: 10.h,
            ),
            const Text('Learn More',
                style: TextStyle(color: ColorManager.greenColor, fontSize: 16)),
            SizedBox(
              height: 60.h,
            ),
            Card(
              elevation: 0.3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cash',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    Text('\$${appDrawerController.user.value.walletAmount}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              elevation: 0.3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cash Out',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    Obx(() => Text('\$${totalCashout.value}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            FilledButton(
              onTap: () {
                _navigateWithdrawAndRefresh(context);

              },
              text: 'Cash WithDraw',
              color: ColorManager.greenColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            FilledButton(
              onTap: () {
                _navigateDepositAndRefresh(context);
                // Get.to(CashDepositScreen());
              },
              text: 'Cash Deposit',
              color: ColorManager.greenColor,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
  void _navigateDepositAndRefresh(BuildContext context) async {
    final result = await Get.to(()=>CashDepositScreen());
    if(result != null){
      await getUserData();
      setState(() {});
    }
  }

  void _navigateWithdrawAndRefresh(BuildContext context) async {
    if(appDrawerController.user.value.accountId == null || appDrawerController.user.value.accountId!.isEmpty){
      showAlertDialog(context);
    }
    else {
      final result = await Get.to(() => CashWithdrawScreen());
      if (result != null) {
        await getUserData();
        setState(() {});
      }
    }
  }


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget ok = TextButton(
      child: Text("Create"),
      onPressed: () async {
        Navigator.pop(context, true);
        LoadingIndicatorDialog().show(context);
        Map<String, dynamic>? stripeAccountID = await StripePayment(context).createStripeAccount();
        if(stripeAccountID != null){
          var stripe = AutoGenerate.fromJson(stripeAccountID);
          LoadingIndicatorDialog().dismiss();
          // Fluttertoast.showToast(msg: "Loading...");
          Get.to(WebViewCustom( stripeUrl: stripe.link.url,
            accountId: stripe.account.id,));
        }
      }
    );
    Widget cancel = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Create Account"),
      content: Text("Please attach your bank account for in app payments!"),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 16),
      contentTextStyle: TextStyle(color: ColorManager.colorTextDarkGray),
      actions: [ cancel, ok],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
