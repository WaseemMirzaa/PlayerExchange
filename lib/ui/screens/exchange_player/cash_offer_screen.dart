import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

import '../../../models/Exchange/exchange_player_model.dart';
import '../../../models/Exchange/offer.dart';

class CashOfferScreen extends StatefulWidget {
  final ExchangePlayerModel exchangePlayerModel;

  const CashOfferScreen({Key? key, required this.exchangePlayerModel}) : super(key: key);

  @override
  _CashOfferScreenState createState() => _CashOfferScreenState();
}

class _CashOfferScreenState extends State<CashOfferScreen> {
  var shareController = TextEditingController();
  var offerAmountController = TextEditingController();
  var validForController = TextEditingController();
  var isNegotiableController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String validTill = "";

  List<String> list = <String>["No", "Yes"];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;
    DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
      print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');

      picked = date;
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked!;
          validTill = date.toString();
          // validTill = selectedDate.day.toString() +"-"+ selectedDate.month.toString() +"-"+ selectedDate.year.toString()  ;
        });
      }
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    shareController.text = widget.exchangePlayerModel.shares.toString();
    offerAmountController.text = widget.exchangePlayerModel.askingAmount.toString();

    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cash Offer'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: StyleManager().largeFontSize,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                // color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          readOnly: true,

                          style: const TextStyle(color: Colors.black),
                      controller: shareController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: "100",
                        label: Text('Total Share'),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: offerAmountController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        // hintText: "\0",
                        label: Text('Offer Amount (USD)'),
                      ),
                    )),
                    // Expanded(child: CustomTextField(textEditingController: shareController,hint: '2',title: 'Total Shares',)),
                    // Expanded( child: CustomTextField(textEditingController: shareController,hint: '\$40',title: 'Offer Amount',)),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Per Share (Current Value)',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "\$" + (widget.exchangePlayerModel.roster?.cpoAthletes?.currentPricePerShare.toString() ?? ""),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: StyleManager().mediumFontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 100,
                width: double.infinity,
                // color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Valid For',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  height: 64,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          validTill,
                                          // "",
                                          style: TextStyle(fontSize: 15, color: Colors.black),
                                        )),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),

                    // Expanded(
                    //     child: TextFormField(
                    //   controller: shareController,
                    //   decoration: InputDecoration(
                    //     enabledBorder: const OutlineInputBorder(
                    //       borderSide:
                    //           const BorderSide(color: Colors.grey, width: 0.0),
                    //     ),
                    //     focusedBorder: const OutlineInputBorder(
                    //       borderSide:
                    //           const BorderSide(color: Colors.grey, width: 0.0),
                    //     ),
                    //     hintText: "3 Hours",
                    //     label: Text('Valid For'),
                    //   ),
                    // )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Negotiable',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          DropdownButtonFormField(
                            hint: Text('Negotiable'),
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: dropdownValue,
                          ),
                        ],
                      ),

                      // DropdownButton<String>(
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //   elevation: 16,
                      //   style: const TextStyle(color: Colors.black),
                      //   // underline: Container(
                      //   //   height: 2,
                      //   //   color: Colors.deepPurpleAccent,
                      //   // ),
                      //   onChanged: (String? value) {
                      //     // This is called when the user selects an item.
                      //     setState(() {
                      //       dropdownValue = value!;
                      //     });
                      //   },
                      //   items: list.map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),

                      //     TextFormField(
                      //   controller: shareController,
                      //   decoration: InputDecoration(
                      //     enabledBorder: const OutlineInputBorder(
                      //       borderSide:
                      //           const BorderSide(color: Colors.grey, width: 1.0),
                      //     ),
                      //     focusedBorder: const OutlineInputBorder(
                      //       borderSide:
                      //           const BorderSide(color: Colors.grey, width: 1.0),
                      //     ),
                      //     hintText: "No",
                      //     label: Text('Negotiable'),
                      //   ),
                      // )
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: FilledButton(
                      onTap: () {
                        // int count = 2;
                        // Navigator.of(context).popUntil((_) => count-- <= 0);
                        if(offerAmountController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Offer Amount cannot be empty.");
                          return;
                        }
                        if(validForController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Please select Valid For.");
                          return;
                        }

                        APIRequests.doApi_postOffer(new Offer());

                      },
                      text: "Send Offer",
                      reverseColor: true,
                      isFullWidth: false,
                      color: ColorManager.blueGreyButtonColor,
                      paddingHorizontal: 20,
                      padding: 12,
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: FilledButton(
                      onTap: () {},
                      text: "Contact Seller",
                      reverseColor: true,
                      isFullWidth: false,
                      color: ColorManager.blueGreyButtonColor,
                      paddingHorizontal: 20,
                      padding: 12,
                    )),
                    //FilledButton(onTap: (){},text: "CashOut",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Request to @',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      // fontSize: StyleManager().largeFontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
