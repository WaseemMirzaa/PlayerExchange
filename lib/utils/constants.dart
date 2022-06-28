
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{

  static final Constants _constants = Constants._internal();

  factory Constants() {
    return _constants;
  }

  Constants._internal();

  GlobalKey<NavigatorState>? navigatorKey=GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();
}

class TransactionConstants{
  static final String TRANSACTION_TYPE_DEPOSIT = "DEPOSIT";
  static final String TRANSACTION_TYPE_PURCHASE_SHARES = "SHARES_PURCHASE";
  static final String TRANSACTION_TYPE_WITHDRAW = "WITHDRAW";

  static final String PAYMENT_TYPE_STRIPE = "STRIPE";
  static final String PAYMENT_TYPE_WALLET = "WALLET";

}