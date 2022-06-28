import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/buy_screen_controller.dart';
import 'package:player_exchange/controllers/home_screen_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/transactions/transaction_model.dart';
import 'package:player_exchange/networking/api.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/stripe/stripe_payment.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen(
      {Key? key, required this.amount, required this.share, required this.cpoModel})
      : super(key: key);
  final double amount;
  final int share;
  final CpoModel cpoModel;

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late StripePayment stripePayment;
  BuyScreenController buyScreenController = Get.find();
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
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: 200,
                child: Text(
                  "Total: \$${widget.amount}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
            ),
            Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  if (appDrawerController.user.value.walletAmount! < widget.amount) {
                    Fluttertoast.showToast(msg: "Not enough amount in your wallet");
                  } else {
                    showPayWithWalletAlertDialog(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Pay with Wallet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "\$${appDrawerController.user.value.walletAmount}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: InkWell(
                onTap: () async {
                  payWithStripe();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Pay with Master Card",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              AssetsString().masterCardLogo,
                              height: 15,
                              width: 25,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> payWithStripe() async {
    if (!stripePayInProgress) {
      if (widget.amount > 0) {
        stripePayInProgress = true;
        LoadingIndicatorDialog().show(context);
        //Add transaction record in database
        transactionModel = await APIRequests.doApi_addTransaction(TransactionModel(
          userId: appDrawerController.user.value.id,
          amount: widget.amount,
          playerName: widget.cpoModel.playerName,
          playerId: widget.cpoModel.playerId,
          type: TransactionConstants.TRANSACTION_TYPE_PURCHASE_SHARES,
          shares: widget.share,
          paymentType: TransactionConstants.PAYMENT_TYPE_STRIPE,
        ));

        if (transactionModel == null) {
          stripePayInProgress = false;
          LoadingIndicatorDialog().dismiss();
          Fluttertoast.showToast(msg: "Unable to add Transaction.");
        } else {
          //Database transaction is recorded now try Stripe Payment

          stripePayment.makePayment(widget.amount.toString()).then((value) async => {
                stripePayInProgress = false,
                if (value)
                  {
                    buyScreenController
                        .addToRosters(
                            Get.find<AppDrawerController>().user.value.id ?? "",
                            widget.share,
                            widget.cpoModel.currentPricePerShare?.toDouble() ?? 0.0,
                            widget.cpoModel.currentPricePerShare?.toDouble() ?? 0.0,
                            widget.amount,
                            widget.amount,
                            widget.amount,
                            widget.cpoModel.id ?? "")
                        .then((value) async => {
                              LoadingIndicatorDialog().dismiss(),
                              if (value)
                                {
                                  showSuccessAlertDialog(context)
                                  // await Get.off(() => TabsScreen(
                                  //       selectedIndex: TabsScreen.currentIndex,
                                  //     ))
                                }
                              else
                                {
                                  Fluttertoast.showToast(msg: "Unable to purchase"),
                                  //Revert transaction
                                  if (transactionModel != null)
                                    await APIRequests.doApi_removeTransaction(
                                        transactionModel?.id ?? ""),

                                }
                            })
                  }
                else
                  {
                    Fluttertoast.showToast(msg: "Unable to purchase"),
                    LoadingIndicatorDialog().dismiss(),
                    if (transactionModel != null)
                      await APIRequests.doApi_removeTransaction(transactionModel?.id ?? ""),
                  }
              });
        }
      } else {
        Fluttertoast.showToast(msg: "Amount should be greater then 0");
      }
    }
  }

  Future<void> payWithWallet() async {
    User user = appDrawerController.user.value;
    num total = 0;

    if (!stripePayInProgress) {
      if (widget.amount > 0) {
        stripePayInProgress = true;
        LoadingIndicatorDialog().show(context);

        //Add transaction record in database
        transactionModel = await APIRequests.doApi_addTransaction(TransactionModel(
          userId: appDrawerController.user.value.id,
          amount: widget.amount,
          playerName: widget.cpoModel.playerName,
          playerId: widget.cpoModel.playerId,
          type: TransactionConstants.TRANSACTION_TYPE_PURCHASE_SHARES,
          shares: widget.share,
          paymentType: TransactionConstants.PAYMENT_TYPE_WALLET,
        ));

        if (transactionModel == null) {
          stripePayInProgress = false;
          LoadingIndicatorDialog().dismiss();

          Fluttertoast.showToast(msg: "Unable to add Transaction.");
        } else {
          //Database transaction is recorded now try Wallet Payment
          total = (user.walletAmount ?? 0.0) - widget.amount;

          user.walletAmount = total;

          String value = await APIRequests.doApi_updateUserProfile(user.id!, user);

          if (value == Api.ERROR) {
            stripePayInProgress = false;
            Fluttertoast.showToast(msg: "Unable to update Wallet.");
            LoadingIndicatorDialog().dismiss();

            //Revert transaction
            await APIRequests.doApi_removeTransaction(transactionModel?.id ?? "");
          } else {
            buyScreenController
                .addToRosters(
                    Get.find<AppDrawerController>().user.value.id ?? "",
                    widget.share,
                    widget.cpoModel.currentPricePerShare?.toDouble() ?? 0.0,
                    widget.cpoModel.currentPricePerShare?.toDouble() ?? 0.0,
                    widget.amount,
                    widget.amount,
                    widget.amount,
                    widget.cpoModel.id ?? "")
                .then((value) async => {
                      LoadingIndicatorDialog().dismiss(),
                      if (value)
                        {
                          LoadingIndicatorDialog().dismiss(),
                          //Successfully paid with Wallet
                          await APIRequests.doApi_updateUserProfile(user.id!, user),

                          showSuccessAlertDialog(context),
                        }
                      else
                        {
                          Fluttertoast.showToast(msg: "Unable to purchase"),
                          //Revert transaction
                          if (transactionModel != null)
                            await APIRequests.doApi_removeTransaction(
                                transactionModel?.id ?? ""),

                          //Revert Wallet
                          total = (user.walletAmount ?? 0.0) + widget.amount,
                          user.walletAmount = total,
                          await APIRequests.doApi_updateUserProfile(user.id!, user),
                        }
                    });
          }
        }
      } else {
        Fluttertoast.showToast(msg: "Amount should be greater then 0");
      }
    }
  }

  showPayWithWalletAlertDialog(BuildContext context) {
    // set up the button
    Widget ok = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        payWithWallet();
      },
    );
    Widget cancel = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Pay with Wallet"),
      content: Text("Are you sure you want to pay with your wallet?"),
      titleTextStyle: TextStyle(color: ColorManager.greenColor, fontSize: 16),
      contentTextStyle: TextStyle(color: ColorManager.colorTextDarkGray),
      actions: [cancel, ok],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showSuccessAlertDialog(BuildContext context) {
    // set up the button
    Widget ok = TextButton(
      child: Text("Ok"),
      onPressed: () async {
        await homeScreenController.getUserData();
        await Get.off(() => TabsScreen(
              selectedIndex: TabsScreen.currentIndex,
            ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success"),
      content: Text("You have successfully purchased the shares."),
      titleTextStyle: TextStyle(color: ColorManager.greenColor, fontSize: 16),
      contentTextStyle: TextStyle(color: ColorManager.colorTextDarkGray),
      actions: [ok],
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
