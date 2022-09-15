import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:player_exchange/chat/size_constants.dart';
import 'package:player_exchange/chat/text_field_constants.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/exchange/exchange_player_model.dart';
import 'package:player_exchange/models/exchange/offer.dart';
import 'package:player_exchange/models/transactions/transaction_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/DateUtilsCustom.dart';
import 'package:provider/provider.dart';

import '../Networking/api.dart';
import '../main.dart';
import '../models/auth/user_model.dart';
import '../models/rosters/roster_model.dart';
import '../ui/screens/home_tabs/tabs_screen.dart';
import '../utils/alert_dialog_custom.dart';
import '../utils/assets_string.dart';
import '../utils/color_manager.dart';
import '../utils/constants.dart';
import '../utils/session_manager.dart';
import 'chat_message_model.dart';
import 'chat_provider.dart';
import 'color_constants.dart';
import 'common_widgets.dart';
import 'firebase_cloud_messaging.dart';

class ChatPage extends StatefulWidget {
  final String currentUserId;
  final String currentUserName;
  final String peerId;
  final String peerAvatar;
  final String peerNickname;
  final String userAvatar;
  final String offerText;
  final Offer? offer;

  const ChatPage(
      {Key? key,
      required this.peerNickname,
      required this.peerAvatar,
      required this.peerId,
      required this.currentUserId,
      required this.currentUserName,
      required this.userAvatar,
      required this.offerText,
      this.offer})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<QueryDocumentSnapshot> listMessages = [];

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = '';

  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = '';

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  late ChatProvider chatProvider;
  late User receiverUser;
  late BuildContext baseWidgetContext;

  //late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = context.read<ChatProvider>();
    //authProvider = context.read<AuthProvider>();

    focusNode.addListener(onFocusChanged);
    scrollController.addListener(_scrollListener);
    readLocal();

    getReceiverUser().then((value) => {
          if (widget.offerText != "")
            {
              onSendMessage(widget.offerText, MessageType.offer),
            }
        });
  }

  Future<void> getReceiverUser() async {
    receiverUser = await APIRequests.doApi_getUserProfile(widget.peerId ?? "");
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      setState(() {
        isShowSticker = false;
      });
    }
  }

  void readLocal() {
    if (widget.currentUserId.compareTo(widget.peerId) > 0) {
      groupChatId = '${widget.currentUserId} - ${widget.peerId}';
    } else {
      groupChatId = '${widget.peerId} - ${widget.currentUserId}';
    }
    chatProvider.updateFirestoreData(FirestoreCollections.pathUserCollection, widget.currentUserId,
        {FirestoreCollections.chattingWith: widget.peerId});
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        uploadImageFile();
      }
    }
  }

  void getSticker() {
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  Future<bool> onBackPressed() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      chatProvider.updateFirestoreData(FirestoreCollections.pathUserCollection,
          widget.currentUserId, {FirestoreCollections.chattingWith: null});
    }
    return Future.value(false);
  }

  void uploadImageFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask =
        chatProvider.uploadImageFile(imageFile!, "messages/" + groupChatId + "/" + fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, MessageType.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      await Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  Future<void> onSendMessage(String content, String type) async {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatProvider.sendChatMessage(content, type, groupChatId, widget.currentUserId, widget.peerId,
          widget.currentUserName, widget.peerNickname, widget.offer);
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send', backgroundColor: Colors.grey);
    }

    try {
      User? user = await SessionManager.getUserData();
      String msg = "";
      if (type == MessageType.text)
        msg = content;
      else if (type == MessageType.image)
        msg = content;
      else if (type == MessageType.sticker)
        msg = content;
      else if (type == MessageType.offer) msg = content;

      FirebaseCloudMessaging.sendNotification(
          msg, widget.currentUserName, receiverUser.fcmToken ?? "");
      // FirebaseCloudMessaging.sendNotification(msg, widget.currentUserName, "40vFN7IbxAwY8Q4Et9B7JeGR633nVkzoUL4131kDGjezzpeh7eUs0Mzw58o6ZsHRXHQuy27vhIgRWzUkAuj");
    } catch (e) {
      print(e);
    }
  }

  // checking if received message
  bool isMessageReceived(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreCollections.idFrom) == widget.currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  // checking if sent message
  bool isMessageSent(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreCollections.idFrom) != widget.currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    baseWidgetContext = context;
    return Scaffold(
      appBar: customAppBar(context,
          leadingIcon: AssetsString().BackArrowIcon, title: widget.peerNickname),

      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('${widget.peerNickname}'.trim()),
      //   backgroundColor: ColorManager.greenColor,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
          child: Column(
            children: [
              buildListMessage(context),
              buildMessageInput(),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMessageInput() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: Sizes.dimen_4),
            decoration: BoxDecoration(
              color: ColorManager.greenColor,
              borderRadius: BorderRadius.circular(Sizes.dimen_30),
            ),
            child: IconButton(
              onPressed: getImage,
              icon: const Icon(
                Icons.camera_alt,
                size: Sizes.dimen_28,
              ),
              color: AppColors.white,
            ),
          ),
          Flexible(
              child: TextField(
            focusNode: focusNode,
            textInputAction: TextInputAction.send,
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            controller: textEditingController,
            decoration: kTextInputDecoration.copyWith(
                hintText: 'Message', hintStyle: TextStyle(color: Colors.black.withOpacity(0.5))),
            onSubmitted: (value) {
              onSendMessage(textEditingController.text, MessageType.text);
            },
          )),
          Container(
            margin: const EdgeInsets.only(left: Sizes.dimen_4),
            decoration: BoxDecoration(
              color: ColorManager.greenColor,
              borderRadius: BorderRadius.circular(Sizes.dimen_30),
            ),
            child: IconButton(
              onPressed: () {
                onSendMessage(textEditingController.text, MessageType.text);
              },
              icon: const Icon(Icons.send_rounded),
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext baseContext, int index, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot);
      if (chatMessages.idFrom == widget.currentUserId) {
        // right side (my message)
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                chatMessages.type == MessageType.text
                    ? messageBubble(
                        chatContent: chatMessages.content,
                        color: ColorManager.greenColor,
                        textColor: AppColors.white,
                        margin: const EdgeInsets.symmetric(vertical: Sizes.dimen_6),
                      )
                    : chatMessages.type == MessageType.image
                        ? Container(
                            margin:
                                const EdgeInsets.only(right: Sizes.dimen_10, top: Sizes.dimen_10),
                            child: chatImage(imageSrc: chatMessages.content, onTap: () {}),
                          )
                        : chatMessages.type == MessageType.offer
                            ? offerMessageBubble(
                                baseContext: baseContext,
                                chatContent: chatMessages.content,
                                offer: chatMessages.offer!,
                                color: ColorManager.greenColor,
                                textColor: AppColors.white,
                                margin: const EdgeInsets.symmetric(vertical: Sizes.dimen_6),
                                isMyMsg: chatMessages.idFrom == widget.currentUserId,
                                chatMessages: chatMessages)
                            : const SizedBox.shrink(),
                isMessageSent(index)
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.dimen_20),
                        ),
                        child: Image.network(
                          widget.userAvatar,
                          width: Sizes.dimen_40,
                          height: Sizes.dimen_40,
                          fit: BoxFit.cover,
                          loadingBuilder:
                              (BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.burgundy,
                                value: loadingProgress.expectedTotalBytes != null &&
                                        loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: AppColors.greyColor,
                            );
                          },
                        ),
                      )
                    : Container(
                        width: 35,
                      ),
              ],
            ),
            isMessageSent(index)
                ? Container(
                    margin: const EdgeInsets.only(
                        right: Sizes.dimen_50, top: Sizes.dimen_6, bottom: Sizes.dimen_8),
                    child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(chatMessages.timestamp),
                        ),
                      ),
                      style: const TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isMessageReceived(index)
                    // left side (received message)
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.dimen_6),
                        ),
                        child: Image.network(
                          widget.peerAvatar,
                          width: Sizes.dimen_40,
                          height: Sizes.dimen_40,
                          fit: BoxFit.cover,
                          loadingBuilder:
                              (BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.burgundy,
                                value: loadingProgress.expectedTotalBytes != null &&
                                        loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: AppColors.greyColor,
                            );
                          },
                        ),
                      )
                    : Container(
                        width: 35,
                      ),
                chatMessages.type == MessageType.text
                    ? messageBubble(
                        color: ColorManager.buttonGreyColor.withOpacity(0.6),
                        textColor: Colors.black,
                        chatContent: chatMessages.content,
                        margin: const EdgeInsets.symmetric(vertical: Sizes.dimen_10),
                      )
                    : chatMessages.type == MessageType.image
                        ? Container(
                            margin:
                                const EdgeInsets.only(left: Sizes.dimen_10, top: Sizes.dimen_10),
                            child: chatImage(imageSrc: chatMessages.content, onTap: () {}),
                          )
                        : chatMessages.type == MessageType.offer
                            ? offerMessageBubble(
                                baseContext: baseContext,
                                chatContent: chatMessages.content,
                                offer: chatMessages.offer!,
                                color: ColorManager.buttonGreyColor.withOpacity(0.6),
                                textColor: Colors.black,
                                margin: const EdgeInsets.symmetric(vertical: Sizes.dimen_10),
                                isMyMsg: chatMessages.idFrom == widget.currentUserId,
                                chatMessages: chatMessages)
                            : const SizedBox.shrink(),
              ],
            ),
            isMessageReceived(index)
                ? Container(
                    margin: const EdgeInsets.only(
                        left: Sizes.dimen_50, top: Sizes.dimen_6, bottom: Sizes.dimen_8),
                    child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(chatMessages.timestamp),
                        ),
                      ),
                      style: const TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildListMessage(BuildContext baseContext) {
    return Flexible(
      child: groupChatId.isNotEmpty
          ? StreamBuilder<QuerySnapshot>(
              stream: chatProvider.getChatMessage(groupChatId, _limit),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                  listMessages = snapshot.data!.docs;
                  if (listMessages.isNotEmpty) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data?.docs.length,
                        reverse: true,
                        controller: scrollController,
                        itemBuilder: (context, index) =>
                            buildItem(baseContext, index, snapshot.data?.docs[index]));
                  } else {
                    return const Center(
                      child: Text('No messages...'),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.burgundy,
                    ),
                  );
                }
              })
          : const Center(
              child: CircularProgressIndicator(
                color: AppColors.burgundy,
              ),
            ),
    );
  }

  Widget offerMessageBubble({
    required BuildContext baseContext,
    required String chatContent,
    required Offer offer,
    required EdgeInsetsGeometry? margin,
    Color? color,
    Color? textColor,
    required bool isMyMsg,
    required ChatMessages chatMessages,
  }) {
    return Container(
      padding: const EdgeInsets.all(Sizes.dimen_10),
      margin: margin,
      width: Sizes.dimen_250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Sizes.dimen_10),
      ),
      child: Column(
        children: [
          Text(
            chatContent +
                "\n\n" +
                "Valid till: " +
                DateUtilsCustom.convertISO_8601_ToDateTime(offer.validFor ?? "")
                    .replaceFirst("\n", " ") +
                "\n" +
                "Negotiable: " +
                (offer.isNegotiable! ? "Yes" : "No") +
                "\n" +
                "Offer Type: " +
                (offer.offerType == OfferTypeConstants.CASH_OFFER ? "Cash" : "Exchange") +
                "\n",
            style: TextStyle(fontSize: Sizes.dimen_16, color: textColor),
          ),
          offer.status != OfferStatusConstants.PENDING
              ? Text(
                  // "Status: " +
                  (offer.status == OfferStatusConstants.PENDING
                      ? "Pending"
                      : offer.status == OfferStatusConstants.ACCEPTED
                          ? (offer.offerType == OfferTypeConstants.CASH_OFFER
                              ? "Payment Pending"
                              : "Exchange Pending")
                          : offer.status == OfferStatusConstants.REJECTED
                              ? "Rejected"
                              : offer.status == OfferStatusConstants.CANCELED
                                  ? "Canceled"
                                  : offer.status == OfferStatusConstants.PAID
                                      ? (offer.offerType == OfferTypeConstants.CASH_OFFER
                                          ? "Paid"
                                          : "Exchanged")
                                      : ""),
                  style: TextStyle(
                      fontSize: Sizes.dimen_20, color: textColor, fontWeight: FontWeight.bold),
                )
              : Container(),
          !isMyMsg
              ? Visibility(
                  visible: offer.status == OfferStatusConstants.PENDING,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red, backgroundColor: Colors.white),
                        child: Text('Reject'),
                        onPressed: () async {
                          await APIRequests.doApi_updateOffer(
                              Offer(id: offer.id, status: OfferStatusConstants.REJECTED));

                          await fireStore
                              .collection(FirestoreCollections.pathMessageCollection)
                              .doc(groupChatId)
                              .collection(FirestoreCollections.chatConservations)
                              .doc(chatMessages.id)
                              .update({'offer.status': OfferStatusConstants.REJECTED});
                          setState(() {});
                          print('Rejected Pressed');
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      OutlinedButton(
                        child: Text('Accept'),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green, backgroundColor: Colors.white),
                        onPressed: () async {
                          await APIRequests.doApi_updateOffer(
                              Offer(id: offer.id, status: OfferStatusConstants.ACCEPTED));

                          await fireStore
                              .collection(FirestoreCollections.pathMessageCollection)
                              .doc(groupChatId)
                              .collection(FirestoreCollections.chatConservations)
                              .doc(chatMessages.id)
                              .update({'offer.status': OfferStatusConstants.ACCEPTED});
                          setState(() {});
                          print('Accepted Pressed');
                        },
                      )
                    ],
                  ),
                )
              : Visibility(
                  visible: offer.status == OfferStatusConstants.PENDING ||
                      offer.status == OfferStatusConstants.ACCEPTED,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      offer.status == OfferStatusConstants.PENDING
                          ? OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red, backgroundColor: Colors.white),
                              child: Text('Cancel'),
                              onPressed: () async {
                                await APIRequests.doApi_updateOffer(
                                    Offer(id: offer.id, status: OfferStatusConstants.CANCELED));

                                await fireStore
                                    .collection(FirestoreCollections.pathMessageCollection)
                                    .doc(groupChatId)
                                    .collection(FirestoreCollections.chatConservations)
                                    .doc(chatMessages.id)
                                    .update({'offer.status': OfferStatusConstants.CANCELED});
                                setState(() {});
                                print('Cancel Pressed');
                              },
                            )
                          : offer.status == OfferStatusConstants.ACCEPTED
                              ? OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.green, backgroundColor: Colors.white),
                                  child: Text(
                                      chatMessages.offer?.offerType == OfferTypeConstants.EXCHANGE
                                          ? 'Exchange'
                                          : 'Pay'),
                                  onPressed: () async {
                                    if (chatMessages.offer?.offerType ==
                                        OfferTypeConstants.CASH_OFFER) {
                                      payWithWallet(
                                          baseWidgetContext,
                                          chatMessages.offer?.offerAmount ?? 0,
                                          chatMessages.offer?.totalShares ?? 0,
                                          chatMessages);
                                    } else if (chatMessages.offer?.offerType ==
                                        OfferTypeConstants.EXCHANGE) {}

                                    payWithExchange(baseWidgetContext,
                                        chatMessages.offer?.totalShares ?? 0, chatMessages);

                                    print('Pay Pressed');
                                  },
                                )
                              : Container(),
                    ],
                  ),
                )
        ],
      ),
    );
  }

  // set up the AlertDialog
  showPayWithWalletAlertDialog(
      BuildContext context, num amount, num shares, ChatMessages chatMessages) {
    // set up the button
    Widget ok = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        payWithWallet(context, amount, shares, chatMessages);
      },
    );
    Widget cancel = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
        // Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Pay with Wallet"),
      content: Text("Are you sure you want to pay with your wallet?"),
      titleTextStyle: TextStyle(color: ColorManager.greenColor, fontSize: 16),
      contentTextStyle: TextStyle(color: ColorManager.colorTextDarkGray),
      actions: [cancel, ok],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showSuccessAlertDialog(BuildContext context, String msg) {
    // set up the button
    Widget ok = TextButton(
      child: Text("Ok"),
      onPressed: () async {
        // await homeScreenController.getUserData();
        setState(() {});

        // Navigator.of(context).pop();
        await Get.off(() => TabsScreen(
              selectedIndex: TabsScreen.currentIndex,
            ));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success"),
      content: Text(msg),
      titleTextStyle: TextStyle(color: ColorManager.greenColor, fontSize: 16),
      contentTextStyle: TextStyle(color: ColorManager.colorTextDarkGray),
      actions: [ok],
    );

    // show the dialog
    showDialog(
      context: baseWidgetContext,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  AppDrawerController appDrawerController = Get.find();

  // HomeScreenController homeScreenController = Get.find();
  bool stripePayInProgress = false;
  TransactionModel? transactionModel = null;

  Future<void> payWithWallet(
      BuildContext baseContext, num amount, num shares, ChatMessages chatMessages) async {
    User user = appDrawerController.user.value;
    num total = 0;

    if ((user.walletAmount ?? 0) < amount) {
      showMessageDialog("You don't have enough amount in your wallet, please recharge.",
          baseWidgetContext, () => {});
      // Fluttertoast.showToast(msg: "You don't have enough amount in your wallet, please recharge.");
      return;
    }

    if (!stripePayInProgress) {
      if (amount > 0) {
        stripePayInProgress = true;
        LoadingIndicatorDialog().show(baseContext);

        ExchangePlayerModel? exchangePlayerModel = await APIRequests.doApi_getExchangePlayer(
            chatMessages.offer?.exchangePlayerModelId ?? "");
        if (exchangePlayerModel == null) {
          stripePayInProgress = false;
          LoadingIndicatorDialog().dismiss();
          Fluttertoast.showToast(msg: "Unable to get Player");
          return;
        }

        //    check if the person who added exchange player still have enough shares in his roster
        RosterModel rosterModel =
            await APIRequests.doApi_getRoster(exchangePlayerModel.roster?.id ?? "");
        if (shares > (rosterModel.sharesBought ?? 0)) {
          stripePayInProgress = false;
          LoadingIndicatorDialog().dismiss();
          showMessageDialog("Seller does not have enough shares now.", baseWidgetContext, () => {});
          return;
        }

        //Add transaction record in database
        transactionModel = await APIRequests.doApi_addTransaction(TransactionModel(
          userId: appDrawerController.user.value.id,
          amount: amount,
          playerName: exchangePlayerModel.roster?.cpoAthletes?.playerName ?? "",
          playerId: exchangePlayerModel.roster?.cpoAthletes?.playerId ?? "",
          type: TransactionConstants.TRANSACTION_TYPE_OFFER_PURCHASE_SHARES,
          shares: exchangePlayerModel.shares,
          paymentType: TransactionConstants.PAYMENT_TYPE_WALLET,
        ));

        if (transactionModel == null) {
          stripePayInProgress = false;
          LoadingIndicatorDialog().dismiss();

          Fluttertoast.showToast(msg: "Unable to add Transaction.");
        } else {
          //Database transaction is recorded now try Wallet Payment
          total = (user.walletAmount ?? 0.0) - amount;

          user.walletAmount = total;

          String value = await APIRequests.doApi_updateUserProfile(user.id!, user);

          if (value == Api.ERROR) {
            stripePayInProgress = false;
            Fluttertoast.showToast(msg: "Unable to update Wallet.");
            LoadingIndicatorDialog().dismiss();

            //Revert transaction
            await APIRequests.doApi_removeTransaction(transactionModel?.id ?? "");
          } else {
            await APIRequests.doApi_rostersExchangeCashOffer(exchangePlayerModel.roster?.id ?? "",
                    amount, shares, user.id ?? "", exchangePlayerModel.id ?? "")
                .then((value) async => {
                      if (value)
                        {
                          //Successfully paid with Wallet
                          await APIRequests.doApi_updateUserProfile(user.id!, user),

                          //Update status offer status
                          await APIRequests.doApi_updateOffer(Offer(
                              id: chatMessages.offer?.id ?? "", status: OfferStatusConstants.PAID)),

                          await fireStore
                              .collection(FirestoreCollections.pathMessageCollection)
                              .doc(groupChatId)
                              .collection(FirestoreCollections.chatConservations)
                              .doc(chatMessages.id)
                              .update({'offer.status': OfferStatusConstants.PAID}),

                          LoadingIndicatorDialog().dismiss(),
                          stripePayInProgress = false,

                          setState(() {}),
                          showSuccessAlertDialog(baseContext,"You have successfully purchased the shares."),
                        }
                      else
                        {
                          Fluttertoast.showToast(msg: "Unable to purchase"),
                          //Revert transaction
                          if (transactionModel != null)
                            await APIRequests.doApi_removeTransaction(transactionModel?.id ?? ""),

                          //Revert Wallet
                          total = (user.walletAmount ?? 0.0) + amount,
                          user.walletAmount = total,
                          await APIRequests.doApi_updateUserProfile(user.id!, user),
                          stripePayInProgress = false,
                          LoadingIndicatorDialog().dismiss(),
                        }
                    });
          }
        }
      } else {
        Fluttertoast.showToast(msg: "Amount should be greater then 0");
      }
    }
  }

  Future<void> payWithExchange(
      BuildContext baseContext, num shares, ChatMessages chatMessages) async {
    User user = appDrawerController.user.value;
    num total = 0;

    stripePayInProgress = true;
    LoadingIndicatorDialog().show(baseContext);

    ExchangePlayerModel? exchangePlayerModel =
        await APIRequests.doApi_getExchangePlayer(chatMessages.offer?.exchangePlayerModelId ?? "");
    if (exchangePlayerModel == null) {
      stripePayInProgress = false;
      LoadingIndicatorDialog().dismiss();
      Fluttertoast.showToast(msg: "Unable to get Player");
      return;
    }

    RosterModel? rosterModelBuyer =
        await APIRequests.doApi_getRoster(chatMessages.offer?.buyerRosterId ?? "");
    if (rosterModelBuyer == null) {
      stripePayInProgress = false;
      LoadingIndicatorDialog().dismiss();
      Fluttertoast.showToast(msg: "Unable to get Roster");
      return;
    }

    //    check if the person who added exchange player still have enough shares in his roster
    RosterModel rosterModelSeller =
        await APIRequests.doApi_getRoster(exchangePlayerModel.roster?.id ?? "");
    if (shares > (rosterModelSeller.sharesBought ?? 0)) {
      stripePayInProgress = false;
      LoadingIndicatorDialog().dismiss();
      showMessageDialog("Seller does not have enough shares now.", baseWidgetContext, () => {});
      return;
    }

    await APIRequests.doApi_rostersExchangeOffer(exchangePlayerModel.roster?.id ?? "", shares,
            user.id ?? "", exchangePlayerModel.id ?? "", chatMessages.offer?.buyerRosterId ?? "")
        .then((value) async => {
              if (value)
                {
                  //Update status offer status
                  await APIRequests.doApi_updateOffer(
                      Offer(id: chatMessages.offer?.id ?? "", status: OfferStatusConstants.PAID)),

                  await fireStore
                      .collection(FirestoreCollections.pathMessageCollection)
                      .doc(groupChatId)
                      .collection(FirestoreCollections.chatConservations)
                      .doc(chatMessages.id)
                      .update({'offer.status': OfferStatusConstants.PAID}),

                  LoadingIndicatorDialog().dismiss(),
                  stripePayInProgress = false,

                  setState(() {}),
                  showSuccessAlertDialog(baseContext, "You have successfully exchanged the player."),
                }
              else
                {
                  Fluttertoast.showToast(msg: "Unable to Exchange"),
                  stripePayInProgress = false,
                  LoadingIndicatorDialog().dismiss(),
                }
            });
  }
}
