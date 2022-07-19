import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/ui/screens/home_tabs/discover_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/exchange_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/home_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/messages_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/profile_screen.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';

class TabsScreen extends StatefulWidget {
  static final String BottomNavigationSelectionKey =
      'BottomNavigationSelectionKey';
  final bottomNavBarKey = new GlobalKey(debugLabel: 'btm_nav_bar');
  static int currentIndex = 0;

  TabsScreen({Key? key, var selectedIndex}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  DateTime? currentBackPressTime;

  double bottomNavIconSize(int index) => TabsScreen.currentIndex == index
      ? ScreenUtil().setHeight(25)
      : ScreenUtil().setHeight(23);

  Color bottomNavIconColor(int index) => TabsScreen.currentIndex == index
      ? ColorManager.greenColor
      : ColorManager.buttonBorderGreyColor;

  final homeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  final discoverKey = GlobalKey<NavigatorState>(debugLabel: 'discover');
  final exchnageKey = GlobalKey<NavigatorState>(debugLabel: 'exchange');
  final messagesKey = GlobalKey<NavigatorState>(debugLabel: 'messages');
  final profileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

  NavigatorState? getCurrentNavigatorKey() {
    if (TabsScreen.currentIndex == 0)
      return homeKey.currentState;
    else if (TabsScreen.currentIndex == 1)
      return discoverKey.currentState;
    else if (TabsScreen.currentIndex == 2)
      return exchnageKey.currentState;
    else if (TabsScreen.currentIndex == 3)
      return messagesKey.currentState;
    else if (TabsScreen.currentIndex == 4)
      return profileKey.currentState;
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigatorState? key = getCurrentNavigatorKey();

        if (key == null) SystemNavigator.pop(animated: true);
        /* else {
          if (Provider.of<GeneralProvider>(context, listen: false).allowCheckoutNavigation == true)
          {
            Provider.of<GeneralProvider>(context, listen: false).checkoutHomePop();
            // SystemNavigator.pop(animated: true);
          }
          else {
            if (key.canPop()) {
              key.pop();
            } else
              handleWillPop(context);
          }
        }*/
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.grey, blurRadius: 0.5),
            ],
          ),
          child: BottomNavigationBar(
            key: widget.bottomNavBarKey,
            type: BottomNavigationBarType.fixed,
            currentIndex: TabsScreen.currentIndex,
            // selectedLabelStyle: TextStyle(fontSize: 22),
            selectedItemColor: ColorManager.greenColor,
            onTap: (index) {
              if (TabsScreen.currentIndex == index) {
                NavigatorState? key = getCurrentNavigatorKey();
                if (key!.canPop()) key.popUntil((route) => route.isFirst);
              } else {
                setState(() {
                  TabsScreen.currentIndex = index;
                });
                /* if (index == 1) {
                  // if(!checkoutService.isGuestCheckout){
                 */ /* Get.to(LoginPage()).then((value) {
                    if (StaticInfo.currentUser != null)
                      setState(() {
                        currentIndex = index;
                      });
                  });*/ /*
                  // }
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }*/
              }
            },

            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsString().homeIcon,
                  color: TabsScreen.currentIndex == 0
                      ? ColorManager.greenColor
                      : ColorManager.buttonBorderGreyColor,
                  width: bottomNavIconSize(0),
                ),
                // ignore: deprecated_member_use
                label: "home".tr,

              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsString().discoverIcon,
                  color: TabsScreen.currentIndex == 1
                      ? ColorManager.greenColor
                      : ColorManager.buttonBorderGreyColor,
                  width: bottomNavIconSize(1),
                ),
                // ignore: deprecated_member_use
                label: "discover".tr,


              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsString().exchangeIcon,
                  color: TabsScreen.currentIndex == 2
                      ? ColorManager.greenColor
                      : ColorManager.buttonBorderGreyColor,
                  width: bottomNavIconSize(1),
                ),
                // ignore: deprecated_member_use
                label: "eXchange".tr,

              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsString().messageIcon,
                  color: TabsScreen.currentIndex == 3
                      ? ColorManager.greenColor
                      : ColorManager.buttonBorderGreyColor,
                  width: bottomNavIconSize(3),
                ),
                // ignore: deprecated_member_use
                label: "messages".tr,

              ),
              BottomNavigationBarItem(
                // icon: Obx (() {return new SizedBox(
                //   child: Image(
                //     image: NetworkImage(Get.find<AppDrawerController>(tag: "AppDrawerController").user.value.profilePicture ?? ""),
                //   ),
                //   width: 38,
                //   height: 38,
                // );}),
                icon: Obx(() {
                  return CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage(Get.find<AppDrawerController>()
                        .user
                        .value
                        .profilePicture ??
                        ""),
                    backgroundColor: Colors.white,
                  );
                }),
                label: "profile".tr,

              ),
            ],

          ),
        ),
        body: IndexedStack(
          index: TabsScreen.currentIndex,
          children: [
            TabsScreen.currentIndex == 0 ? Navigator(
              key: homeKey,
              onGenerateRoute: (_) {
                return MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                );
              },
            ) : Container(),
            TabsScreen.currentIndex == 1 ? Navigator(
              key: discoverKey,
              onGenerateRoute: (_) {
                return MaterialPageRoute(
                  builder: (_) => DiscoverScreen(),
                );
              },
            ): Container(),
            TabsScreen.currentIndex == 2 ? Navigator(
              key: exchnageKey,
              onGenerateRoute: (_) {
                return MaterialPageRoute(
                  builder: (_) => ExchangeScreen(),
                );
              },
            ): Container(),
            TabsScreen.currentIndex == 3 ? Navigator(
              key: messagesKey,
              onGenerateRoute: (_) {
                return MaterialPageRoute(
                  builder: (_) => MessagesScreen(),
                );
              },
            ): Container(),
            TabsScreen.currentIndex == 4 ? Navigator(
              key: profileKey,
              onGenerateRoute: (_) {
                return MaterialPageRoute(
                  builder: (_) => ProfileScreen(),
                );
              },
            ): Container(),
          ],
        ),
      ),
    );
  }

  handleWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press back again to leave");
      return Future.value(false);
    }
    SystemNavigator.pop(animated: true);
  }
}
