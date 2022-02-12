import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,leadingIcon: AssetsString().BackArrowIcon),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            SizedBox(
              width: 200,
                child: Text("Transfer to Player eXchange",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                style: TextStyle(
                  fontSize: 25,
                ),
                cursorColor: ColorManager.greenColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset(AssetsString().card),
                  )),
            ),
            Text("Change Account",style: TextStyle(color: ColorManager.greenColor,fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
