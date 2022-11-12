import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
import '../library_nosubcription_screen/components/custom_image.dart';
import '../common/custom_round_card.dart';
import 'package:once/screens/common/quitwhispercard.dart';

class LibrarySubcriptionScreen extends StatefulWidget {
  const LibrarySubcriptionScreen({Key? key}) : super(key: key);

  @override
  State<LibrarySubcriptionScreen> createState() =>
      _LibrarySubcriptionScreenState();
}

class _LibrarySubcriptionScreenState extends State<LibrarySubcriptionScreen> {
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
          style: TextStyle(fontSize: 22, color: blackColor),
        ),
        actions: [
          SvgPicture.asset('images/maleicon.svg'),
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
          Colors.grey.shade300,
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
            QuitWhisperCard(
              image: 'images/profile.png',
              onPressed: () {},
            ),
            QuitWhisperCard(
              image: 'images/profile2.png',
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Find more creators",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color:blueColor,fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Favorite",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
}
