import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:player_exchange/controllers/discover_screen_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/cpo_detail_from_discovery.dart';
import 'package:player_exchange/ui/screens/detail_page/team_detail_screen.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverScreenController discoverScreenController = Get.put(DiscoverScreenController());
  List<CpoModel> cpoItemList = <CpoModel>[];

  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'NG6pvXpnIso',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  void initState() {
    init();
  }

  Future<void> init() async {
    await discoverScreenController.getWatchList();
    await discoverScreenController.getTeamsList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // discoverScreenController.getWatchList();

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Obx (() => Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Browse",
                        style: TextStyle(
                            fontSize: StyleManager().largeFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // CustomTextField(
                  //     hintText: 'Search',
                  //     controller: TextEditingController(),
                  //     prefix: Icon(
                  //       Icons.search,
                  //       color: Colors.black,
                  //     ),
                  //     isRoundedCorner: true),

                  PaginatedSearchBar<CpoModel>(
                    hintText: "Search Athlete",
                    searchDebounceDuration: Duration(seconds: 1),
                    onSearch: ({
                      required pageIndex,
                      required pageSize,
                      required searchQuery,
                    }) async {
                      // return Future.delayed(const Duration(milliseconds: 1000), () {
                      if (searchQuery == "empty") {
                        return [];
                      }

                      return await APIRequests.doApi_getCpoAthletesWithNames(
                          playerName: searchQuery);
                      // });
                      // Call your search API to return a list of items
                    },
                    itemBuilder: (context, {
                      required item,
                      required index,
                    }) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(CpoDetailFromDiscovery(cpoModel: item,));
                          // Get.to(() =>
                          //     CpoDetailFromDiscovery(
                          //         cpoModel: widget.rosterModel.cpoAthletes ?? CpoModel()));
                        },
                        child: Text(
                          item.playerName ?? "",
                          style: TextStyle(
                              fontSize: StyleManager().smallFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                      );
                    },
                  ),

                  Container(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Teams",
                              style: TextStyle(
                                  fontSize: StyleManager().mediumFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            // SizedBox(width: 3,),
                            // Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 12,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.h,
                  ),
                  Wrap(
                      spacing: 1.0,
                      runSpacing: 4,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: addTeams()),
                  Container(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Opacity(
                        opacity: 0,
                        child: SvgPicture.asset(AssetsString().ArrowDown),
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Watch'.tr,
                                style: TextStyle(
                                    fontSize: StyleManager().mediumFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ))),
                      SvgPicture.asset(AssetsString().ArrowDown)
                      // Expanded(flex: 1, child: SvgPicture.asset(AssetsString().ArrowDown),),

                      // SizedBox(width: 3,),
                      // Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 12,)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 220.h,
                    width: double.infinity,
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: () {
                              Get.to(CpoDetailFromDiscovery(
                                  cpoModel:
                                  discoverScreenController.favoriteList.value[index].cpoAthletes ??
                                      new CpoModel()));
                            },
                            child: RoasterListItem(
                              rosterModel: new RosterModel(),
                              isRoster: false,
                              cpoModel: discoverScreenController.favoriteList[index].cpoAthletes ??
                                  new CpoModel(),
                            ));
                      },
                      itemCount: discoverScreenController.favoriteList.length,
                      separatorBuilder: (_, index) => CustomDivider(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: YoutubePlayer(
                      controller: youtubeController,
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.redAccent,
                        handleColor: Color(0xffFF6757),
                      ),
                      onReady: () {},
                    ),
                  ),
                ],
              )),
            ),
          ),
        ));
  }

  List<Widget> addTeams() {
    List<Widget> myTags = <Widget>[];
    for (int i = 0; i < discoverScreenController.teamsList.length; i++) {
      myTags.add(GestureDetector(
        onTap: () {
          Get.to(() => TeamDetailScreen(team: discoverScreenController.teamsList[i]));
        },
        child: Card(
          elevation: 0,
          // elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: ColorManager.lightGreyDivider, width: 1)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              // "EUR ${(i + 1).toString()}",
              "${discoverScreenController.teamsList[i].name}",
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ),
        ),
      )); // TODO: Whatever layout you need for each widget.
    }
    return myTags;
  }
}

// class SelectedItemWidget extends StatelessWidget {
//   const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);
//
//   final CpoModel selectedItem;
//   final VoidCallback deleteSelectedItem;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         vertical: 2,
//         horizontal: 4,
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 16,
//                 right: 16,
//                 top: 8,
//                 bottom: 8,
//               ),
//               child: Text(
//                 selectedItem.playerName ?? "",
//                 style: const TextStyle(fontSize: 14),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.delete_outline, size: 22),
//             color: Colors.grey[700],
//             onPressed: deleteSelectedItem,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyTextField extends StatelessWidget {
//   const MyTextField(this.controller, this.focusNode);
//
//   final TextEditingController controller;
//   final FocusNode focusNode;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//         decoration: InputDecoration(
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Color(0x4437474F),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Theme.of(context).primaryColor),
//           ),
//           suffixIcon: Icon(Icons.search),
//           border: InputBorder.none,
//           hintText: "Search here...",
//           contentPadding: const EdgeInsets.only(
//             left: 16,
//             right: 20,
//             top: 14,
//             bottom: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NoItemsFound extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Icon(
//           Icons.folder_open,
//           size: 24,
//           color: Colors.grey[900]!.withOpacity(0.7),
//         ),
//         const SizedBox(width: 10),
//         Text(
//           "No Items Found",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey[900]!.withOpacity(0.7),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class PopupListItemWidget extends StatelessWidget {
//   const PopupListItemWidget(this.item);
//
//   final CpoModel item;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       child: Text(
//         item.playerName!,
//         style: const TextStyle(fontSize: 16),
//       ),
//     );
//   }
// }
