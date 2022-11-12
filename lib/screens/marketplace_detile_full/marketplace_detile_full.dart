import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../marketplace_detile_full/components/circle.dart';
import '../marketplace_detile_full/components/round_card.dart';

class MarketPlaceDetailFull extends StatefulWidget {
  final String? image;

  const MarketPlaceDetailFull({Key? key, this.image}) : super(key: key);

  @override
  State<MarketPlaceDetailFull> createState() => _MarketPlaceDetailFullState();
}

class _MarketPlaceDetailFullState extends State<MarketPlaceDetailFull> {
  List<String> images = [
    'images/circle.png',
    'images/nature.png',
    'images/city.png',
    'images/table.png'
  ];
  List<String> message = ['Fireplace', 'Nature', 'City', 'Table'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        widget.image!,
                        height: 145,
                        width: 125,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "QuietWhispers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('images/youtube.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset('images/instigram.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset('images/tiktok.svg'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "34k folowers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xFF4D4C4C)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 155),
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Soundscapes",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 150,
                          child: ListView.builder(
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Cirlcle(
                                  image: images[index],
                                  message: message[index],
                                );
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Affrimation",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: ListView.builder(
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return RoundCard(
                                  image: 'images/image.jpg',
                                  title:
                                      "One small positive thought in the\nmorning can change my whole\nday. So, today I rise with a ..",
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Coaching",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (_, index) {
                                return RoundCard(
                                  image: 'images/coaching.jpg',
                                  title:
                                      "One small positive thought in the morning can change my whole day. So, today I rise with a",
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Positive Videos",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //positive-videos
                        Container(
                          height: 200,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                height: 180,
                                width: 210,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('images/positive.png'))),
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 180,
                                width: 210,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('images/positive.png'))),
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //subscribe button
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Subscribe for \$ 3.99",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
