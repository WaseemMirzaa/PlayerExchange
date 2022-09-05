import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_text_field.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/Exchange/exchange_player_model.dart';

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
  String validTill = "Valid Till";





  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2050, 1, 1),
        onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          print('confirm $date');
          picked = date;
          if (picked != null && picked != selectedDate) {
            //   setState(() {
            //     selectedDate = picked;
            //     validTill = selectedDate.day.toString() +"-"+ selectedDate.month.toString() +"-"+ selectedDate.year.toString()  ;
            //
            //   });
          }

        }, currentTime: DateTime.now(), locale: LocaleType.en);


    // final DateTime? picked = await showDatePicker(
    //     context: context,
    //     builder: (context, child){
    //       return Theme(
    //           data: Theme.of(context).copyWith(
    //             colorScheme: ColorScheme.light(
    //
    //               onSurface: Colors.black, // body text color
    //             ),
    //           ), child: child!);
    //     },
    //
    //     initialDate: selectedDate,
    //     firstDate: DateTime.now(),
    //     lastDate: DateTime(2101));
    //
    // if (picked != null && picked != selectedDate) {
    //   setState(() {
    //     selectedDate = picked;
    //     validTill = selectedDate.day.toString() +"-"+ selectedDate.month.toString() +"-"+ selectedDate.year.toString()  ;
    //
    //   });

  }

  @override
  Widget build(BuildContext context) {
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
                      controller: shareController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: "2",
                        label: Text('Total Share'),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: shareController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: "\$45",
                        label: Text('Offer Amount'),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Per Share',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '\$22.50',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: StyleManager().mediumFontSize),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: double.infinity,
                // color: Colors.red,
                child:
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: (){
                            _selectDate(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color:  Colors.grey)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(validTill, style: TextStyle(fontSize: 15, color: Colors.grey),)),
                              ),
                            ),
                          )
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
                        child: TextFormField(
                      controller: shareController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        hintText: "No",
                        label: Text('Negotiable'),
                      ),
                    )),
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
                        int count = 2;
                        Navigator.of(context).popUntil((_) => count-- <= 0);
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
              SizedBox(height: 20.h,),
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
              SizedBox(height: 40.h,),
            ],
          ),
        ),
      ),
    );
  }
}
