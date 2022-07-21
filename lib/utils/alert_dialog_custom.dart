import 'package:flutter/material.dart';

 void showMessageDialog(String msg, BuildContext context, Function() onPressed) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(msg, style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );



}