import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:player_exchange/utils/constants.dart';

import '../models/exchange/offer.dart';

class ChatMessages {
  String id;
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  String type;
  Offer? offer;

  ChatMessages(
      {
        required this.id,
        required this.idFrom,
        required this.idTo,
        required this.timestamp,
        required this.content,
        required this.type,
         required this.offer,
      });

  Map<String, dynamic> toJson() {
    return {
      FirestoreCollections.id: id,
      FirestoreCollections.idFrom: idFrom,
      FirestoreCollections.idTo: idTo,
      FirestoreCollections.timestamp: timestamp,
      FirestoreCollections.content: content,
      FirestoreCollections.type: type,
      FirestoreCollections.offer : offer?.toJson(),
    };
  }

  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot.get(FirestoreCollections.id);
    String idFrom = documentSnapshot.get(FirestoreCollections.idFrom);
    String idTo = documentSnapshot.get(FirestoreCollections.idTo);
    String timestamp = documentSnapshot.get(FirestoreCollections.timestamp);
    String content = documentSnapshot.get(FirestoreCollections.content);
    String type = documentSnapshot.get(FirestoreCollections.type);
    Offer? offer;
    if(documentSnapshot.get(FirestoreCollections.offer) != null)
      offer = Offer.fromJson(documentSnapshot.get(FirestoreCollections.offer));


    return ChatMessages(
      id: id,
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type,
      offer: offer
    );
  }
}
