import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:once/screens/common/custom_tile.dart';
import 'package:once/screens/profile_screen/personalize.dart';

import '../common/header_card.dart';
import '../constant.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCard(onTap: (){
              Navigator.pop(context);
            },
            title: 'Account',
              subTitle: 'Manage your Identity &\nSubscriptions',
              icon: 'images/user.svg',
            ),
            SizedBox(height: 20,),
            CustomTile(
              title: 'Pesonalize',
              image: 'images/user.svg',

              onTap: (){
                Get.to(
                        ()=> Personalize(),
                    duration: Duration(milliseconds: 300),
                    transition: Transition.rightToLeft
                );
              },
            ),
            CustomTile(
              title: 'Password',
              image: 'images/input-pipe.svg',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text("Subscription",style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            CustomTile(
              title: 'Subscription',
              image: 'images/user-unlock.svg',
            ),
            CustomTile(
              title: 'History',
              image: 'images/rectangle-history.svg',
            ),
          ],
        ),
      ),
    );
  }
}


