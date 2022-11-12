import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:once/screens/market_place_view_b/market_Place_view_b.dart';
import 'package:once/screens/tab_quotes_screen/tab_quotes.dart';

import '../tab_marketplace/tab_marketplace.dart';

class TabMarketPlaceHomeScreen extends StatefulWidget {
  const TabMarketPlaceHomeScreen({Key? key}) : super(key: key);

  @override
  State<TabMarketPlaceHomeScreen> createState() => _TabMarketPlaceHomeScreenState();
}

class _TabMarketPlaceHomeScreenState extends State<TabMarketPlaceHomeScreen> {
  List<Widget> pagesList = [TabQuotes(), MarketPlaceView()];

  bool jump = true;

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: pagesList[_currentIndex],
        ),
      ),

    );
  }
}
