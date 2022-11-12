import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:once/screens/picker_categories/picker_categories.dart';
import 'package:once/screens/profile_screen/about.dart';
import 'package:once/screens/profile_screen/account.dart';
import 'package:once/screens/profile_screen/admin_dashboard.dart';
import 'package:once/screens/profile_screen/become_a_creator.dart';
import 'package:once/screens/profile_screen/content_setting.dart';
import 'package:once/screens/profile_screen/creator_dashboard/creator_dashboard.dart';
import 'package:once/screens/profile_screen/general_setting.dart';
import 'package:once/screens/profile_screen/help.dart';
import 'package:once/screens/profile_screen/notification.dart';

import '../Drawer/drawer.dart';
import '../common/custom_round_card.dart';
import '../constant.dart';
import '../end_drawer/end_drawer.dart';
import '../library_subcription_screen/library_subcription_screen.dart';
import '../market_place_view_b/market_Place_view_b.dart';
import '../profile_screen/profile_screen.dart';
import '../profile_screen/widget.dart';
import '../tab_marketplace/tab_marketplace.dart';
import 'components/custom_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:once/AuthFlutterFire/signin_screen.dart';
import 'package:once/screens/profile_screen/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Drawer/drawer.dart';
import '../account_screen/account_screen.dart';
import '../common/custom_tile.dart';
import '../constant.dart';
import '../picker_categories/picker_categories.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  SharedPreferences? preferences;
  var currentUser = FirebaseAuth.instance.currentUser;

  final googleSignIn = GoogleSignIn();

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    super.initState();
  }

  List quotesNo = [
    '24 Quotes',
    '15 Quotes',
    '5 Quotes',
    '24 Quotes',
  ];
  List title = [
    "Morning Quotes",
    "Daily Quotes",
    'Evening Quotes',
    'Evening Quotes'
  ];
  List images = [
    'images/Circleim.png',
    "images/f.png",
    'images/bck.png',
    "images/f.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Library",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        actions: [
          InkWell(
              onTap: () {
                bottomSheet(context);
              },
              child: SvgPicture.asset('images/maleicon.svg')),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFDEEFFF),
          Colors.grey.shade200,
          whiteColor,
        ])),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Subscriptions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SvgPicture.asset('images/subcriotion.svg'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You have no active\nsubscribtions",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return TabMarketPlace();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Find Creators",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(PickerCategories(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.rightToLeftWithFade);
                  },
                  child: Text(
                    "Favorite",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Spacer(),
                Text(
                  "See More",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CustomRoundCard(
                      image: 'images/Circleim.png',
                      title:
                          "I don’t compare myself to\nothers. The only person I\ncompare myself to is the",
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: blackColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.favorite,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your Todays Quotes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Container(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: title.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        CustomImage(
                          image: images[index],
                          quotesNo: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/quotes.svg',
                                height: 10,
                                width: 10,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                quotesNo[index],
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          title[index],
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your Yesterday Quotes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: title.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        CustomImage(
                          image: images[index],
                          quotesNo: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'images/quotes.svg',
                                height: 10,
                                width: 10,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                quotesNo[index],
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          title[index],
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.95,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                        color: blueColor,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // googleuser == null
                          //     ?
                          SizedBox(
                              height: 160,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('userlistflutterfire')
                                    .where(
                                      "email",
                                      isEqualTo: preferences!
                                                      .getString('email') ==
                                                  '' ||
                                              preferences!.getString('email') ==
                                                  null
                                          ? currentUser!.email
                                          : preferences?.getString('email') ??
                                              '',
                                    )
                                    .snapshots(),
                                // _usersStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Something went wrong');
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("Loading");
                                  }

                                  return ListView(
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      return Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25),
                                          ),
                                          color: blueColor,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/Rectangle 2949.png"))),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              data['email'].toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: whiteColor),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            preferences!.getString('email') ==
                                                        '' ||
                                                    preferences!.getString(
                                                            'email') ==
                                                        null
                                                ? Text(
                                                    data['selectedUser']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: whiteColor),
                                                  )
                                                : Text(
                                                    'creator/user',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: whiteColor),
                                                  ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                              )),
                          //     : Container(
                          //         child: Center(
                          //           child: Text(googleSignIn.currentUser!.email
                          //               .toString()),
                          //         ),
                          //       ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTile(
                      title: "Account",
                      image: 'images/user.svg',
                      onTap: () {
                        Get.to(() => Account(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "Notification",
                      image: 'images/notifications.svg',
                      onTap: () {
                        Get.to(() => NotificationScreen(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "Widgets ",
                      image: 'images/widgets.svg',
                      onTap: () {
                        Get.to(() => WidgetScreen(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "Content Settings ",
                      image: 'images/content.svg',
                      onTap: () {
                        Get.to(() => ContentSetting(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "General Settings ",
                      image: 'images/set.svg',
                      onTap: () {
                        Get.to(() => GeneralSetting(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "Help",
                      image: 'images/help.svg',
                      onTap: () {
                        Get.to(() => Help(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "Become a Creator",
                      image: 'images/creator.svg',
                      onTap: () {
                        Get.to(() => BecomeCreator(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "About",
                      image: 'images/about.svg',
                      onTap: () {
                        Get.to(About(),
                            duration: Duration(milliseconds: 300),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Log Out"),
                                  content: Text("Are you sure to Logout?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        if (preferences!.getString('email') ==
                                                '' ||
                                            preferences!.getString('email') ==
                                                null) {
                                          await preferences?.setBool(
                                              'isLoggedIn', false);
                                          await FirebaseAuth.instance.signOut();
                                          Fluttertoast.showToast(
                                              msg: "Successfully logout");

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      SignInScreen()),
                                              (route) => false);
                                          // Navigator.of(context).pop();
                                        } else if (preferences!
                                                    .getString('email') !=
                                                '' ||
                                            preferences!.getString('email') !=
                                                null) {
                                          await googleSignIn.disconnect();
                                          await preferences!.remove('email');
                                          await FirebaseAuth.instance.signOut();

                                          Fluttertoast.showToast(
                                              msg: "Successfully logout");

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      SignInScreen()),
                                              (route) => false);
                                          // Navigator.of(context).pop();
                                        } else {
                                          print('error');
                                        }

                                        // await preferences?.setBool(
                                        //     'isLoggedIn', false);
                                        // await FirebaseAuth.instance.signOut();
                                        // Fluttertoast.showToast(
                                        //     msg: "Successfully logout");

                                        // Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => SignInScreen()),
                                        //     (route) => false);

                                        //   Fluttertoast.showToast(
                                        //     msg: "Successfully logout");
                                        //  Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => SignInScreen()),
                                        //     (route) => false);
                                      },
                                      child: Text("Log Out"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cancel"),
                                    ),
                                  ],
                                );
                              });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Backend Dashboards",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTile(
                      title: "Creator Dashboard ",
                      image: 'images/cdash.svg',
                      onTap: () {
                        Get.to(() => CreatorDashBoard(),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    CustomTile(
                      title: "Admin Dashboard",
                      image: 'images/adash.svg',
                      onTap: () {
                        Get.to(() => AdminDashboard(),
                            transition: Transition.rightToLeft);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
