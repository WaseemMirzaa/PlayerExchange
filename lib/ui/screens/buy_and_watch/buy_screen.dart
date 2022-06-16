import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/buy_screen_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/stripe/Stripe.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/number_utils.dart';

class BuyScreen extends StatefulWidget {
  final CpoModel cpoModel;

  BuyScreen(this.cpoModel, {Key? key}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  RxDouble purchaseAmt = 0.0.obs;
  RxInt estShare = 0.obs;

  late StripePayment stripePayment;
  BuyScreenController buyScreenController = Get.put(BuyScreenController());

  @override
  void initState() {
    super.initState();
    stripePayment = StripePayment(context);
    stripePayment.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text(
                "Buy Fields Stock",
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${widget.cpoModel.sharesAvailable} Available Shares",
                style: TextStyle(color: ColorManager.greenColor, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Purchase Amount",
                    style:
                        TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$" + purchaseAmt.value.toString(),
                    style:
                        TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Est. Price per share",
                    style:
                        TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ ${widget.cpoModel.currentPricePerShare}",
                    style:
                        TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Est. Shares",
                    style:
                        TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$" + estShare.value.toString(),
                    style:
                        TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 50,
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
                    labelText: "Enter Shares",
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
                  onChanged: (String? shares) {
                    if (NumberUtils.isNumeric(shares)) {
                      purchaseAmt.value = (widget.cpoModel.currentPricePerShare?.toDouble() ?? 0) *
                          double.parse(shares!);
                      estShare.value = int.parse(shares);
                    } else {
                      estShare.value = 0;
                    }
                  },
                  style:
                      TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            // Get.to(() => const PaymentScreen());
            if (purchaseAmt.value > 0) {
              stripePayment.makePayment(purchaseAmt.value.toString()).then((value) => {
                    if (value)
                      {
                        buyScreenController
                            .addToRosters(
                                Get.find<AppDrawerController>().user.value.id ?? "",
                                estShare.value,
                                widget.cpoModel.currentPricePerShare?.toDouble() ?? 0.0,
                                widget.cpoModel.currentPricePerShare?.toDouble() ?? 0.0,
                                purchaseAmt.value,
                                purchaseAmt.value,
                                purchaseAmt.value,
                                widget.cpoModel.id ?? "")
                            .then((value) async => {
                                  if (value)
                                    {
                                      await Get.off(() => TabsScreen(
                                            selectedIndex: TabsScreen.currentIndex,
                                          ))
                                    }
                                  else
                                    {}
                                })
                      }
                    else
                      {Fluttertoast.showToast(msg: "Unable to purchase")}
                  });
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
                  "Review",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
