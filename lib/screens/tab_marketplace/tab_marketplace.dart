import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Drawer/drawer.dart';
import '../market_place_view_b/marketPlaceHomeScreen.dart';
import '../marketplace_detile_full/marketplace_detile_full.dart';
import 'components/tabmarketplace_quietwhisperscard.dart';

class TabMarketPlace extends StatefulWidget {
  const TabMarketPlace({Key? key}) : super(key: key);

  @override
  State<TabMarketPlace> createState() => _TabMarketPlaceState();
}

class _TabMarketPlaceState extends State<TabMarketPlace> {
  List<String> imageList = [
    'images/profile.png',
    'images/profile2.png',
  ];
  int currentIndex = 1;

  // bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Creators",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 40),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF1F1F1),
                    hintText: 'Search',
                    contentPadding: EdgeInsets.only(left: 10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 2,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        MarketPlaceDetailFull(
                          image: index == 0
                              ? 'images/profile.png'
                              : 'images/profile2.png',
                        ),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.leftToRight
                      );
                    },
                    child: TabMarketPlaceQuietWhispersCard(
                      image: imageList[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return TabMarketPlaceHomeScreen();
                          }),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
