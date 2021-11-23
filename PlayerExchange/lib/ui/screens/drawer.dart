import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
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
              Navigator.of(context).pop();
            },
          ),
          _createDrawerItem(
            icon: Icons.account_balance,
            text: 'Cashier Window',
            onTap: () {
              Navigator.of(context).pop();
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
              Navigator.of(context).pop();
            },
          ),
          _createDrawerItem(
            icon: Icons.notifications,
            text: 'Notification Settings',
            onTap: () {
              Navigator.of(context).pop();
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
              Navigator.of(context).pop();
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
      onTap: onTap,
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
          Text('\$0.00', style: TextStyle(fontSize: 18)),
          Container(
            height: 10,
          ),
          Text(
            'Account Balance',
            style: TextStyle(fontSize: 18),
          ),
          Text('\$0.00', style: TextStyle(fontSize: 18, color: Colors.green)),
          // )
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Container(
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
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text("@Hike",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200))
                  ],
                )),
          ])),
    );
  }
}
