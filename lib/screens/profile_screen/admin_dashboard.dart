import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:once/screens/common/custom_tile.dart';
import 'package:once/screens/profile_screen/adminDashboard/users_data.dart';

import '../constant.dart';
import '../user_management/user_management.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF07C9E0), Color(0xFF1DDDB4)]),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'images/adash.svg',
                        height: 30,
                        width: 30,
                        color: blueColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Admin Dashboard',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: whiteColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Dashboard for System Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: whiteColor),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
               // Get.to(UsersData());
                Get.to( UserManagement());

              },
              leading: Icon(
                Icons.person_outline,
                size: 40,
                color: Colors.grey.shade700,
              ),
              title: Text('Users managment'),
            ),
            CustomTile(
              trailing: "",
              title: 'Global App Values',
              image: 'images/globel.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'Quote Types',
              image: 'images/quote.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'Linked Content Types',
              image: 'images/Heart empty.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'Categories',
              image: 'images/cati.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'Themes',
              image: 'images/theme.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'Sounds',
              image: 'images/sound.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'SoundScapes',
              image: 'images/soundscap.svg',
            ),
            CustomTile(
              trailing: "",
              title: 'Quotes',
              image: 'images/quo.svg',
            ),
          ],
        ),
      ),
    );
  }
}
