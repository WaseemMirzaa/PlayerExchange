import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/Exchange/exchange_player_model.dart';
import 'package:player_exchange/models/transactions/transaction_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/select_exchange_player_detail_screen.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/DateUtilsCustom.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  var list = <TransactionModel>[].obs;
  AppDrawerController appDrawerController = Get.find();

  var headingStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
  );
  var itemStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );



  @override
  void initState() {
    APIRequests.doApi_getTransactions(userId: appDrawerController.user.value.id ?? "").then((value) => {
      list.value = value
    });
  }

  @override
  Widget build(BuildContext context) {
    // APIRequests.doApi_getExchangePlayers().then((value) => {
    //   list.value = value
    // });
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),

      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Text(
      //     "Transaction History",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w800,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Transactions History',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Type",
                    style: headingStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Payment Type",
                    style: headingStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Amount",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Shares.",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Date",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
            Obx(() => Expanded(
              child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return getItemWidget(list.value[i]);
                },
              ),
            )),

          ],
        ),
      ),
    );
  }

  Widget getItemWidget(TransactionModel transactionModel) {
    return Column(
      children: [
        SizedBox(height: 1,),
        Container(
          color: transactionModel.type == TransactionConstants.TRANSACTION_TYPE_DEPOSIT ? ColorManager.transactionColor_Deposit:
          transactionModel.type == TransactionConstants.TRANSACTION_TYPE_WITHDRAW ? ColorManager.transactionColor_Withdraw :
          ColorManager.transactionColor_Purchase,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [

                Expanded(
                  flex: 1,
                  child: Text(
                    transactionModel.type ?? "",
                    style: itemStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    transactionModel.paymentType ?? "",
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    transactionModel.amount?.toString() ?? "0.0",
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    transactionModel.shares?.toString() ?? "0",
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    DateUtilsCustom.convertISO_8601_ToDateTime(transactionModel.createdAt ?? ""),
                    // transactionModel.createdAt.toString() ?? "",
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ],
    );

  }
}
