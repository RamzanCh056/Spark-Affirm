// import 'package:flutter/material.dart';
// import 'package:once/screens/common/custom_tile.dart';
//
// import '../common/header_card.dart';
// import '../constant.dart';
//
// class BecomeCreator extends StatelessWidget {
//   const BecomeCreator({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             HeaderCard(
//               onTap: (){
//                 Navigator.pop(context);
//               },
//               title: 'Become a Creator',
//               subTitle: 'Manage Settings for\nyour experience',
//               icon: 'images/creator.svg',
//             ),
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               color: blueColor,
//               child: Column(
//                 children: [
//                   Text(
//                     "Creators earn monthly income by providing\ncustomized content.",textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: whiteColor),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     "If you are an Influencer/Creator with an\nexisting audience - we are interested in\nhearing from you.",textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: whiteColor),
//                   ),
//                   SizedBox(height: 20,),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//             CustomTile(
//               title: 'Request to Become a Creator',
//               image: 'images/creator.svg',
//             ),
//             CustomTile(
//               title: 'Suggest a Creator',
//               image: 'images/message-smile.svg',
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
