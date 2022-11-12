import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:once/AuthFlutterFire/signin_screen.dart';
import 'package:once/screens/test_page/test_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Categories/categories.dart';
import '../picker_categories/picker_categories.dart';
import '../picker_readby/picker_readby.dart';
import '../tab_marketplace/tab_marketplace.dart';

class TabQuotes extends StatefulWidget {
  const TabQuotes({Key? key}) : super(key: key);

  @override
  State<TabQuotes> createState() => _TabQuotesState();
}

class _TabQuotesState extends State<TabQuotes> {
  bool isTap = false;
  SharedPreferences? preferences;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image:
                // AssetImage('images/shape.jpg'),
                AssetImage('images/tes.jpeg'),
            // AssetImage('images/shape.jpg'),
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(TestPage());
                    },
                    child: Icon(
                      FontAwesomeIcons.table,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.arrowUpFromBracket,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isTap = !isTap;
                        });
                      },
                      child: isTap
                          ? Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outlined,
                              color: Colors.white,
                            )),
                ],
              ),
              Spacer(),
              Text(
                "I accept myself for who I am and create peace, power and confidence of mind and of heart",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Spacer(),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Categories(context);
                    },
                    height: 45,
                    color: Colors.black.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/Vector.svg',
                          color: Colors.white,
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "General",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    color: Colors.black.withOpacity(0.6),
                    onPressed: () {
                      PickerReadBy(context);
                    },
                    height: 45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('images/emoji.svg',
                            color: Colors.white, height: 25, width: 25),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Quiet read",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
