import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/quitwhispercard.dart';
import '../constant.dart';
import '../market_place_detile_slideup/marketplace_detaile_slideup.dart';

class MarketPlaceView extends StatelessWidget {
  const MarketPlaceView({Key? key}) : super(key: key);

  // List<String> imageList = [, 'images/profile2.png',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Creators",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        actions: [
          SvgPicture.asset('images/maleicon.svg'),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 40, top: 10, bottom: 15),
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
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (_, index) {
              return QuitWhisperCard(
                image: index % 2 == 0
                    ? 'images/profile.png'
                    : 'images/profile2.png',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MarketPlaceDetileSlideUp(
                      image: index % 2 == 0
                          ? 'images/profile.png'
                          : 'images/profile2.png',
                    );
                  }));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}


