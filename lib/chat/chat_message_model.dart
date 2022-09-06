import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:player_exchange/utils/constants.dart';

class ChatMessages {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  ChatMessages(
      {required this.idFrom,
        required this.idTo,
        required this.timestamp,
        required this.content,
        required this.type});

  Map<String, dynamic> toJson() {
    return {
      FirestoreCollections.idFrom: idFrom,
      FirestoreCollections.idTo: idTo,
      FirestoreCollections.timestamp: timestamp,
      FirestoreCollections.content: content,
      FirestoreCollections.type: type,
    };
  }

  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    String idFrom = documentSnapshot.get(FirestoreCollections.idFrom);
    String idTo = documentSnapshot.get(FirestoreCollections.idTo);
    String timestamp = documentSnapshot.get(FirestoreCollections.timestamp);
    String content = documentSnapshot.get(FirestoreCollections.content);
    int type = documentSnapshot.get(FirestoreCollections.type);

    return ChatMessages(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}
