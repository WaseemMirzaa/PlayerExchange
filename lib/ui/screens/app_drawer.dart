import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:player_exchange/chat/firebase_cloud_messaging.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/ui/screens/Transactions/cash_screen.dart';
import 'package:player_exchange/ui/screens/Transactions/transaction_history_screen.dart';
import 'package:player_exchange/ui/screens/authentication/auth_screen.dart';
import 'package:player_exchange/ui/screens/authentication/login_screen.dart';
import 'package:player_exchange/ui/screens/pdf_viewer_screen_backup.dart';
import 'package:player_exchange/ui/screens/splash_screen.dart';
import 'package:player_exchange/utils/session_manager.dart';

import 'home_tabs/tabs_screen.dart';
import 'notification_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  AppDrawerController appDrawerController = Get.find();
  String? userId= "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    Future<User?> user = SessionManager.getUserData();
    await user.then((value) => {userId = value?.id?? "" });
    debugPrint("user id : " + userId.toString() );
  }

  // AppDrawerController appDrawerController = Get.put(AppDrawerController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _titleAndBalance(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Discover Home',
            onTap: () => Navigator.of(context).pop(),
          ),
          _createDrawerIcon(
            icon: Image.asset(
              'assets/menu_profile.png',
              width: 20,
              height: 20,
            ),
            text: 'User Account',
            onTap: () {
              // Navigator.popUntil(
              //   context,
              //   ModalRoute.withName('/'),
              // );
              Navigator.of(context).pop();
              TabsScreen.currentIndex = 4;
              Get.offAll(() => TabsScreen(
                    selectedIndex: 4,
                  ));
              //  ` Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => TabsScreen(
              //               selectedIndex: 4,
              //             )),
              //   );
            },
          ),
          _createDrawerItem(
            icon: Icons.account_balance,
            text: 'Cashier Window',
            onTap: () {
              // Navigator.of(context).pop();
              Get.to(CashScreen());

            },
          ),
          _createDrawerIcon(
            icon: Image.asset(
              'assets/transactions.png',
              width: 20,
              height: 20,
            ),
            text: 'Transactions History',
            onTap: () {
              Get.to(TransactionHistoryScreen());

            },
          ),
          _createDrawerItem(
            icon: Icons.notifications,
            text: 'Notification Settings',
            onTap: () {
              Get.to(NotificationSettings());
            },
          ),
          _createDrawerIcon(
            icon: Image.asset(
              'assets/refferal.png',
              width: 20,
              height: 20,
            ),
            text: 'Referrals',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.play_arrow,
            text: 'How To Play',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          _createDrawerIcon(
            icon: Image.asset(
              'assets/terms.png',
              width: 20,
              height: 20,
            ),
            text: 'Terms of Service',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          _createDrawerItem(
            icon: Icons.help,
            text: 'Help & Support',
            onTap: () {
              Get.to(PdfViewerScreen(pdfPath: 'assets/pdfs/support.pdf',));
            },
          ),
          _createDrawerIcon(
            icon: Image.asset(
              'assets/privacy.png',
              width: 20,
              height: 20,
            ),
            text: 'Privacy Policy',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          //Logout
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
              Navigator.of(context).pop();

              FirebaseCloudMessaging.stopNotificationService(userId: userId ?? "");
              SessionManager.setUserData(new User());
              Get.offAll(AuthScreen());

            },
          ),

        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap:onTap,
    );
  }

  Widget _createDrawerIcon(
      {required Image icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon,
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _titleAndBalance() {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Padding(
          // padding: EdgeInsets.only(left: 8.0),
          // child:
          Container(
            height: 20,
          ),
          Text(
            'Account Value',
            style: TextStyle(fontSize: 18),
          ),
          Text('\$' + (appDrawerController.user.value.totalValue ?? 0.0).toString()  , style: TextStyle(fontSize: 18)),
          Container(
            height: 10,
          ),
          Text(
            'Account Balance',
            style: TextStyle(fontSize: 18),
          ),
          Text('\$' + (appDrawerController.user.value.walletAmount ?? 0.0).toString(), style: TextStyle(fontSize: 18, color: Colors.green)),
          // )
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Obx ((){ return Container(
      height: 150,
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 10,
                bottom: 12.0,
                left: 16.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(appDrawerController.user.value.profilePicture ?? ""),

                      backgroundColor: Colors.white,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(appDrawerController.user.value.name ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200))
                  ],
                )),
          ])),
    );});
  }
}
