import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/DateUtilsCustom.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/style_manager.dart';

import '../../../chat/chat_page.dart';
import '../../../controllers/app_drawer_controller.dart';
import '../../../models/exchange/exchange_player_model.dart';
import '../../../models/exchange/offer.dart';
import '../../../models/auth/user_model.dart';
import '../../../utils/session_manager.dart';

class CashOfferScreen extends StatefulWidget {
  final ExchangePlayerModel exchangePlayerModel;


  const CashOfferScreen({Key? key, required this.exchangePlayerModel}) : super(key: key);

  @override
  _CashOfferScreenState createState() => _CashOfferScreenState();
}

class _CashOfferScreenState extends State<CashOfferScreen> {
  AppDrawerController appDrawerController = Get.find();

  var shareController = TextEditingController();
  var offerAmountController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String validTill = "";
  String validTillShowFormat = "";
  String? userId= "";
  String? userName= "";
  User? exchangeUser;


  List<String> list = <String>["No", "Yes"];
  String dropdownValue = "";

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;
    DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
      print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
      print(DateFormat('yyyy-MMMM-dd hh:mm a').format(date));
      picked = date;
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked!;
          validTill = date.toString();
          validTillShowFormat = DateUtilsCustom.convertDateTimeTo_AmPm(date);
          // validTill = selectedDate.day.toString() +"-"+ selectedDate.month.toString() +"-"+ selectedDate.year.toString()  ;
        });
      }
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    Future<User?> user = SessionManager.getUserData();
    await user.then((value) => {userId = value?.id?? "" , userName = value?.name ?? "" });

    exchangeUser = await APIRequests.doApi_getUserProfile(widget.exchangePlayerModel.userId ?? "");
    debugPrint(exchangeUser?.name ?? "" + "ASDA");

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    dropdownValue = list.first;
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
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 100,
                // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          maxLength: 8,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
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
                                          validTillShowFormat,
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
                      onTap: () async {
                        // int count = 2;
                        // Navigator.of(context).popUntil((_) => count-- <= 0);
                        if(offerAmountController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Offer Amount cannot be empty.");
                          return;
                        }
                        if(validTill.isEmpty){
                          Fluttertoast.showToast(msg: "Please select Valid For.");
                          return;
                        }

                        LoadingIndicatorDialog().show(context, text: "Sending Offer...", dismissable: true);
                        Offer offer = Offer(
                          senderId: appDrawerController.user.value.id,
                          receiverId: widget.exchangePlayerModel.userId,
                          exchangePlayerModelId: widget.exchangePlayerModel.id,
                          totalShares: widget.exchangePlayerModel.shares!,
                          offerAmount: double.parse(offerAmountController.text),
                          validFor: DateUtilsCustom.convertDateTime_ToISO_8601(validTill),
                          isNegotiable: dropdownValue == "Yes",
                          status: OfferStatusConstants.PENDING,
                          offerType: OfferTypeConstants.CASH_OFFER
                        );
                        var response = await APIRequests.doApi_postOffer(offer);
                        LoadingIndicatorDialog().dismiss();

                        if(response != null){
                          // Get.back();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    peerId: exchangeUser?.id ?? "",
                                    currentUserId: userId ?? "",
                                    currentUserName: userName ?? "",
                                    peerAvatar: "",
                                    peerNickname: exchangeUser?.name ?? "",
                                    userAvatar: "",
                                    offerText: "Hi, i offer you \$${offer.offerAmount} for ${offer.totalShares} shares of ${widget.exchangePlayerModel.roster?.cpoAthletes?.playerName ?? ""}",
                                    offer: response,
                                  )));
                        }

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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  peerId: exchangeUser?.id ?? "",
                                  currentUserId: userId ?? "",
                                  currentUserName: userName ?? "",
                                  peerAvatar: "",
                                  peerNickname: exchangeUser?.name ?? "",
                                  userAvatar: "",
                                  offerText: "",
                                )));

                      },
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
                    'Request to @' + (exchangeUser?.name ?? ""),
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
