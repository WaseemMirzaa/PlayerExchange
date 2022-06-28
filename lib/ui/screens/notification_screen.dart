import 'package:flutter/material.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/assets_string.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  static const String _title = 'F';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _payment = true;
  bool _comments = true;
  bool _chat = true;
  bool _sharesValueChange = true;
  bool _offer_received = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Notifications Settings",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        SwitchListTile(
          title: const Text('Payment Transfer'),
          value: _payment,
          onChanged: (bool value) {
            setState(() {
              _payment = value;
            });
          },
          // secondary: const Icon(Icons.lightbulb_outline),
        ),
        SwitchListTile(
          title: const Text('Comments'),
          value: _comments,
          onChanged: (bool value) {
            setState(() {
              _comments = value;
            });
          },
          // secondary: const Icon(Icons.lightbulb_outline),
        ),
        SwitchListTile(
          title: const Text('Chat'),
          value: _chat,
          onChanged: (bool value) {
            setState(() {
              _chat = value;
            });
          },
          // secondary: const Icon(Icons.lightbulb_outline),
        ),
        SwitchListTile(
          title: const Text('Shares value change'),
          value: _sharesValueChange,
          onChanged: (bool value) {
            setState(() {
              _sharesValueChange = value;
            });
          },
          // secondary: const Icon(Icons.lightbulb_outline),
        ),
        SwitchListTile(
          title: const Text('Offers Received'),
          value: _offer_received,
          onChanged: (bool value) {
            setState(() {
              _offer_received = value;
            });
          },
          // secondary: const Icon(Icons.lightbulb_outline),
        ),
      ],
    );
  }
}
