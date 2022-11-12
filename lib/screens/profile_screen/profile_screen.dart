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
import 'about.dart';
import 'account.dart';
import 'admin_dashboard.dart';
import 'become_a_creator.dart';
import 'content_setting.dart';
import 'creator_dashboard/creator_dashboard.dart';
import 'general_setting.dart';
import 'help.dart';
import 'notification.dart';

// SharedPreferences? preferences;
// final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//     .collection('userlist')
//     .where('email', isEqualTo: currentUser!.email)
//     .snapshots();

// var currentUser = FirebaseAuth.instance.currentUser;

// void bottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(25),
//         ),
//       ),
//       context: context,
//       builder: (_) {
//         return FractionallySizedBox(
//           heightFactor: 0.95,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(25),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.vertical(
//                         top: Radius.circular(25),
//                       ),
//                       color: blueColor,
//                     ),
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                   color: Colors.white.withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: Center(
//                                 child: Icon(
//                                   Icons.keyboard_arrow_down_rounded,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         SizedBox(
//                           height: 160,
//                           child: StreamBuilder<QuerySnapshot>(
//                             stream: FirebaseFirestore.instance
//                                 .collection('userlistflutterfire')
//                                 .where("email", isEqualTo: currentUser!.email)
//                                 .snapshots(),
//                             // _usersStream,
//                             builder: (BuildContext context,
//                                 AsyncSnapshot<QuerySnapshot> snapshot) {
//                               if (snapshot.hasError) {
//                                 return Text('Something went wrong');
//                               }

//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Text("Loading");
//                               }

//                               return ListView(
//                                 children: snapshot.data!.docs
//                                     .map((DocumentSnapshot document) {
//                                   Map<String, dynamic> data =
//                                       document.data()! as Map<String, dynamic>;
//                                   return Container(
//                                     width: double.infinity,
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(25),
//                                       ),
//                                       color: blueColor,
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           height: 90,
//                                           width: 90,
//                                           decoration: BoxDecoration(
//                                               color: whiteColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               image: DecorationImage(
//                                                   image: AssetImage(
//                                                       "images/Rectangle 2949.png"))),
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                         Text(
//                                           data['email'].toString(),
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w700,
//                                               color: whiteColor),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           data['selectedUser'].toString(),
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               color: whiteColor),
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                   // ListTile(
//                                   //   title: Text(data['full_name']),
//                                   //   subtitle: Text(data['company']),
//                                   // );
//                                 }).toList(),
//                               );
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomTile(
//                     title: "Account",
//                     image: 'images/user.svg',
//                     onTap: () {
//                       Get.to(() => Account(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "Notification",
//                     image: 'images/notifications.svg',
//                     onTap: () {
//                       Get.to(() => NotificationScreen(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "Widgets ",
//                     image: 'images/widgets.svg',
//                     onTap: () {
//                       Get.to(() => WidgetScreen(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "Content Settings ",
//                     image: 'images/content.svg',
//                     onTap: () {
//                       Get.to(() => ContentSetting(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "General Settings ",
//                     image: 'images/set.svg',
//                     onTap: () {
//                       Get.to(() => GeneralSetting(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "Help",
//                     image: 'images/help.svg',
//                     onTap: () {
//                       Get.to(() => Help(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "Become a Creator",
//                     image: 'images/creator.svg',
//                     onTap: () {
//                       Get.to(() => BecomeCreator(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "About",
//                     image: 'images/about.svg',
//                     onTap: () {
//                       Get.to(About(),
//                           duration: Duration(milliseconds: 300),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   ListTile(
//                       leading: Icon(
//                         Icons.logout,
//                         color: Colors.red,
//                       ),
//                       title: Text(
//                         'Logout',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (_) {
//                               return AlertDialog(
//                                 title: Text("Log Out"),
//                                 content: Text("Are you sure to Logout?"),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () async {
//                                       await FirebaseAuth.instance.signOut();
//                                       await preferences?.setBool(
//                                           'isLoggedIn', false);
//                                       Fluttertoast.showToast(
//                                           msg: "Successfully logout");
//                                       Navigator.pushAndRemoveUntil(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (_) => SignInScreen()),
//                                           (route) => false);
//                                     },
//                                     child: Text("Log Out"),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Text("Cancel"),
//                                   ),
//                                 ],
//                               );
//                             });
//                       }),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       "Backend Dashboards",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   CustomTile(
//                     title: "Creator Dashboard ",
//                     image: 'images/cdash.svg',
//                     onTap: () {
//                       Get.to(() => CreatorDashBoard(),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                   CustomTile(
//                     title: "Admin Dashboard",
//                     image: 'images/adash.svg',
//                     onTap: () {
//                       Get.to(() => AdminDashboard(),
//                           transition: Transition.rightToLeft);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }
