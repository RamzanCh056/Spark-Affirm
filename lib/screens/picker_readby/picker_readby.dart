import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/quietwhisper_subscribe_card.dart';

void PickerReadBy(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (ctx) {
        return Container(
            padding: EdgeInsets.all(15),
            child: FractionallySizedBox(
              heightFactor: 0.88,
              child: ListView(
                children: [
                  //Icon and Read by
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFF1F1F1)),
                          child: Icon(Icons.keyboard_arrow_down_sharp),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        "Read by",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Default",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('images/emojiicon.svg'),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "No Reader",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Text(
                                  "Free",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
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
                              "34k followers",
                              style: TextStyle(color: Color(0xFf4D4C4C)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Subscribed",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Subscribed card
                  QuietWhispersSubscribeCard(
                    image: 'images/profile.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuietWhispersSubscribeCard(
                    image: 'images/profile2.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Available",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Available Card
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Opacity(
                              opacity: 0.3,
                                child: Image.asset(
                              'images/profile.png',
                              height: 85,
                              width: 92,
                            )),
                            Positioned(
                                top: 25,
                                left: 35,
                                child: SvgPicture.asset(
                                  'images/Union.svg',
                                  height: 40,
                                  width: 40,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "QuietWhispers",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Icon(
                                  Icons.done,
                                  size: 25,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
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
                              "34k followers",
                              style: TextStyle(color: Color(0xFf4D4C4C)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ));
      });
}
