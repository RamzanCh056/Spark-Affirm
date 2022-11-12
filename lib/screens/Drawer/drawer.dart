import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../account_screen/account_screen.dart';
import '../settings_screen/settings_screen.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 15),
              color: Color(0xFFE3E3E3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'images/circle-user-regular.svg',
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "chriss.al.mcmurray@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AccountScreen();
              }));
            },
            child: Tile(
              svgIcon: 'images/user-regular.svg',
              title: "Account",
            ),
          ),
          Divider(
            indent: 55,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return SettingsScreen();
              }));
            },

            child: Tile(
              svgIcon: 'images/gear.svg',
              title: "Settings",
            ),
          ),
          Divider(
            indent: 55,
            color: Colors.grey,
          ),
          Tile(
            svgIcon: 'images/square-question.svg',
            title: "Help",
          ),
          Divider(
            indent: 55,
            color: Colors.grey,
          ),
          Tile(
            width: 18,
            height: 18,
            svgIcon: 'images/lightusers.svg',
            title: "Become a Creator",
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Color(0xFFF6F6F6),
            child: Text("Backend Dashboards"),
          ),
          Tile(
            svgIcon: 'images/user-group.svg',
            height: 20,
            width: 20,
            title: "Creator Dashboard",
          ),
          Divider(
            indent: 55,
            color: Colors.grey,
          ),
          Tile(
            svgIcon: 'images/admin.svg',
            title: "Admin Dashboard",
          ),
          Divider(
            indent: 55,
            color: Colors.grey,
          ),
          Spacer(),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Version 0.0.9",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String? svgIcon;
  final String? title;
  final double? width;
  final double? height;

  const Tile({
    Key? key,
    this.svgIcon,
    this.title,
    this.width = 25,
    this.height = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIcon!,
            color: Colors.grey,
            height: height,
            width: width,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title!,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
