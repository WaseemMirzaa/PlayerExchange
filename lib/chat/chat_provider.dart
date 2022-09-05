import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_message_model.dart';

class ChatProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ChatProvider(
      {required this.prefs,
      required this.firebaseStorage,
      required this.firebaseFirestore});

  UploadTask uploadImageFile(File image, String filename) {
    Reference reference = firebaseStorage.ref().child(filename);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateFirestoreData(
      String collectionPath, String docPath, Map<String, dynamic> dataUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataUpdate);
  }

  Stream<QuerySnapshot> getChatMessage(String groupChatId, int limit) {
    return firebaseFirestore
        .collection(FirestoreCollections.pathMessageCollection)
        .doc(groupChatId)
        .collection(FirestoreCollections.chatConservations)
        .orderBy(FirestoreCollections.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  Future<void> sendChatMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId, String currentUserName, String peerName) async {

    Map<String, dynamic> message = <String, dynamic>{
      'senderId': currentUserId,
      'receiverId': peerId,
      'messageContent': content,
      'timeStamp': DateTime.now().millisecondsSinceEpoch,
    };

    Map<String, dynamic> participants = <String, dynamic>{
      "senderId": currentUserId,
      "senderName":currentUserName,
      "receiverId": peerId,
      "receiverName":peerName
    };

    Map<String, dynamic> map = <String, dynamic>{
      'participants': participants,
      'lastMessage': message
    };

    await FirebaseFirestore.instance.collection(FirestoreCollections.pathMessageCollection).doc(groupChatId).set(map);

    DocumentReference documentReference = firebaseFirestore
        .collection(FirestoreCollections.pathMessageCollection)
        .doc(groupChatId)
        .collection(FirestoreCollections.chatConservations)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    ChatMessages chatMessages = ChatMessages(
        idFrom: currentUserId,
        idTo: peerId,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content,
        type: type);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, chatMessages.toJson());
    });
  }
}

class MessageType {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
