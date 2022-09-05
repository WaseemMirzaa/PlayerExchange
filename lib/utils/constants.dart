
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

  static final int INITIAL_WALLET_AMOUNT = 10;

}
class FirestoreCollections{
  static const String users = "users";
  static const String chats = "chats";
  static const pathUserCollection = "users";
  static const pathMessageCollection = "messages";
  static const displayName = "displayName";
  static const aboutMe = "aboutMe";
  static const photoUrl = "photoUrl";
  static const chatConservations = "conservation";

  static const phoneNumber = "phoneNumber";
  static const id = "id";
  static const chattingWith = "chattingWith";
  static const idFrom = "idFrom";
  static const idTo = "idTo";
  static const timestamp = "timestamp";
  static const content = "content";
  static const type = "type";
  static const email = "email";
}




class TransactionConstants{
  static final String TRANSACTION_TYPE_DEPOSIT = "DEPOSIT";
  static final String TRANSACTION_TYPE_PURCHASE_SHARES = "SHARES_PURCHASE";
  static final String TRANSACTION_TYPE_WITHDRAW = "WITHDRAW";

  static final String PAYMENT_TYPE_STRIPE = "STRIPE";
  static final String PAYMENT_TYPE_WALLET = "WALLET";

}