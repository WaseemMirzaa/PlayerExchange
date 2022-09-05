import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/home_screen_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/transactions/transaction_model.dart';
import 'package:player_exchange/networking/api.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/stripe/stripe_payment.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/alert_dialog_custom.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/number_utils.dart';
import 'package:player_exchange/utils/session_manager.dart';

class CashWithdrawScreen extends StatefulWidget {
  CashWithdrawScreen({Key? key}) : super(key: key);

  @override
  _CashWithdrawScreenState createState() => _CashWithdrawScreenState();
}

class _CashWithdrawScreenState extends State<CashWithdrawScreen> {
  RxDouble withdrawAmount = 0.0.obs;
  RxInt estShare = 0.obs;

  late StripePayment stripePayment;
  AppDrawerController appDrawerController = Get.find();
  HomeScreenController homeScreenController = Get.find();
  bool stripePayInProgress = false;
  TransactionModel? transactionModel = null;

  @override
  void initState() {
    super.initState();
    stripePayment = StripePayment(context);
    stripePayment.initialize();
  }

  @override
  Widget build(BuildContext context) {
    User user = appDrawerController.user.value;
    num total = 0;

    num availCashoutBalance = (appDrawerController.user.value.walletAmount ?? 0) - Constants.INITIAL_WALLET_AMOUNT;

    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Cash Withdraw',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26)),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                      'This amount will be transfered to your personal account.',
                      style: TextStyle(
                          color: ColorManager.colorTextDarkGray,
                          fontWeight: FontWeight.normal,
                          fontSize: 14)),
                ],
              ),
            ),

            SizedBox(
              height: 150,
            ),


            Text('Available Cashout Balance',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text('\$${availCashoutBalance}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),

            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                textAlign: TextAlign.center,
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                maxLength: 8,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],

                decoration: InputDecoration(
                  // icon: Icon(Icons.),
                  // hintText: 'Shares',
                  labelText: "Enter Amount",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.greenColor, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3.0),
                  ),
                ),

                onSaved: (String? value) {},
                // validator: (String? value){
                //   return value.contains('@') ? 'Do not use the @ char.' : null;
                // },
                onChanged: (String? amount) {
                  if (NumberUtils.isNumeric(amount)) {
                    withdrawAmount.value = double.parse(amount ?? "0");
                  } else {
                    withdrawAmount.value = 0;
                  }
                },
                style: TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          if(withdrawAmount.value > availCashoutBalance){
            showMessageDialog("Withdraw amount can not be greater than Available Balance", context,  () =>{

            });
          }
          else if (withdrawAmount.value > 0) {
            if (!stripePayInProgress) {
              if (withdrawAmount.value > 0) {
                stripePayInProgress = true;

                //Add transaction record in database
                transactionModel = await APIRequests.doApi_addTransaction(TransactionModel(
                  userId: appDrawerController.user.value.id,
                  amount: withdrawAmount.value,
                  playerName: "",
                  playerId: "",
                  type: TransactionConstants.TRANSACTION_TYPE_WITHDRAW,
                  shares: 0,
                  paymentType: TransactionConstants.PAYMENT_TYPE_STRIPE,
                ));

                if (transactionModel == null) {
                  stripePayInProgress = false;
                  Fluttertoast.showToast(msg: "Unable to add Transaction.");
                } else {
                  total =  (user.walletAmount ?? 0.0) - withdrawAmount.value;

                  user.walletAmount = total;
                  String value = await APIRequests.doApi_updateUserProfile(user.id!, user);

                  if (value == Api.ERROR) {
                    stripePayInProgress = false;
                    Fluttertoast.showToast(msg: "Unable to update wallet.");
                    //Revert transaction
                    if (transactionModel != null) {
                      await APIRequests.doApi_removeTransaction(transactionModel?.id ?? "");
                      //Revert Wallet
                      total = (user.walletAmount ?? 0.0) + withdrawAmount.value;
                      user.walletAmount = total;
                    }
                  } else {
                    //Database transaction is recorded now try Stripe Payment

                    String accoountId = user.accountId ?? "";
                    StripePayment(context).payoutOrder(accoountId, StripePayment.convertUsdToCent(withdrawAmount.value.toString())).then((value) async => {
                      stripePayInProgress = false,
                      if (value)
                        {
                        showMessageDialog("You have successfully withdrew \$${withdrawAmount}", context,  () =>{
                          Get.back(result: "back withdraw")

                        }),
                        }
                      else
                        {
                          Fluttertoast.showToast(msg: "Unable to withdraw, please contact with Admin."),
                          //Revert transaction
                          if (transactionModel != null)
                            await APIRequests.doApi_removeTransaction(
                            transactionModel?.id ?? ""),

                          //Revert Wallet
                          total = (user.walletAmount ?? 0.0) + withdrawAmount.value,
                          user.walletAmount = total,
                          // await Future<void>.delayed(Duration(seconds: 1)),

                          await APIRequests.doApi_updateUserProfile(user.id!, user),

                        }
                    });

                  }
                }
              } else {
                Fluttertoast.showToast(msg: "Amount should be greater then 0");
              }
            }
          } else {
            Fluttertoast.showToast(msg: "Amount should be greater then 0");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: ColorManager.greenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Confirm",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
