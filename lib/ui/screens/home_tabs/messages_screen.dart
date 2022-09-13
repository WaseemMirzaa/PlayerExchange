import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_text_field.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../chat/chat_page.dart';
import '../../../chat/size_constants.dart';
import '../../../main.dart';
import '../../../models/auth/user_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/session_manager.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final ScrollController scrollController = ScrollController();

  int _limit = 20;
  final int _limitIncrement = 20;
  String _textSearch = "";
  bool isLoading = false;

  String? userId= "";
  String? userName= "";

  //late String currentUserId;

  Debouncer searchDebouncer = Debouncer();
  StreamController<bool> buttonClearController = StreamController<bool>();
  TextEditingController searchTextEditingController = TextEditingController();

  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'NG6pvXpnIso',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

    scrollController.addListener(scrollListener);
  }
  init() async {
    Future<User?> user = SessionManager.getUserData();
    await user.then((value) => {userId = value?.id?? "" , userName = value?.name ?? "" });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Message', trailing: [

      ]),
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Search',
                controller: TextEditingController(),
                prefix: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                isRoundedCorner: true,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: getFirestoreData(
                    FirestoreCollections.pathMessageCollection,
                    _limit,
                    _textSearch),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                    if ((snapshot.data?.docs.length ?? 0) > 0) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) =>
                        snapshot.data?.docs[index] == null ? Container():
                            buildItem(context, snapshot.data?.docs[index]),
                        controller: scrollController,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      );
                    } else {
                      return const Center(
                        child: Text('No user found...'),
                      );
                    }
                  } else if (snapshot.connectionState  == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          children: const [
                            Text("No data found!")
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getFirestoreData(
      String collectionPath, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      return fireStore
          .collection(collectionPath)
          .limit(limit)
          .where(FirestoreCollections.displayName, isEqualTo: textSearch)
          .snapshots();
    } else {
      return fireStore.collection(collectionPath).limit(limit).snapshots();
    }
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? documentSnapshot) {

    Map<String, dynamic> data =
    documentSnapshot?.data() as Map<String, dynamic>;
    Map<String, dynamic> participents =
    data['participants'] as Map<String, dynamic>;
    if (participents["senderId"] == userId ||  participents["receiverId"] == userId) {

      Map<String, dynamic> lastMessageMap =
      data['lastMessage'] as Map<String, dynamic>;
      String? senderId;
      String? receiverId;
      String? senderName;
      String? receiverName;
      receiverId = participents["receiverId"];
      senderId = participents["senderId"];
      senderName = participents["senderName"];
      receiverName = participents["receiverName"];


      if (receiverId == userId) {
        receiverId = senderId;
        senderId = userId;
        receiverName = senderName;
        senderName = userName;

      }


        return TextButton(
          onPressed: () {
            // onPressed if (KeyboardUtils.isKeyboardShowing()) {
            //    KeyboardUtils.closeKeyboard(context);
            //  }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatPage(
                          peerId: receiverId ?? "",
                          currentUserId: senderId ?? "",
                          currentUserName:senderName ?? "",
                          peerAvatar: "",
                          peerNickname: receiverName ?? "",
                          userAvatar: "",
                      offerText: "",
                      offer: null,
                        )));
          },
          child: ListTile(
            leading: "".isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.dimen_30),
                    child: Image.network(
                      "",
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      loadingBuilder: (BuildContext ctx, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                                color: Colors.grey,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null),
                          );
                        }
                      },
                      errorBuilder: (context, object, stackTrace) {
                        return const Icon(Icons.account_circle, size: 50);
                      },
                    ),
                  )
                : const Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
            title: Text(
              receiverName.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            subtitle:Text(
              lastMessageMap["messageContent"] ?? "",
              style: const TextStyle(color: Colors.black),
            ) ,
          ),
        );

    } else {
      return const SizedBox.shrink();
    }
  }
}
