import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class TabMarketPlaceQuietWhispersCard extends StatelessWidget {
  final String ? image;
  final VoidCallback ? onTap;
  const TabMarketPlaceQuietWhispersCard({
    Key? key, this.image, this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    image!,
                    height: 145,
                    width: 125,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "QuietWhispers",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
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
                          SvgPicture.asset(
                              'images/instigram.svg'),
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
                ],
              ),
              Spacer(),
              InkWell(onTap: onTap,
                  child: Text("Subscribe for \$ 3.99",
                    style: TextStyle(fontWeight: FontWeight.w500,
                        color: Color(0xFF229DFF)),))
            ],
          ),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: [
                            Row(

                              children: [
                                SvgPicture.asset(
                                    'images/Soundscapes.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                      color: Color(0xFF70B4EB),
                                      fontSize: 20,
                                      fontWeight: FontWeight
                                          .w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Soundscapes",
                              style: TextStyle(
                                  color: Color(0xFF70B4EB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: [
                            Row(
                              children: [

                                SvgPicture.asset(
                                    'images/quotes.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "24",
                                  style: TextStyle(
                                      color: Color(0xFFFFBA90),
                                      fontSize: 20,
                                      fontWeight: FontWeight
                                          .w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Affrimation",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Divider(thickness: 1, height: 1,),

                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'images/male.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                      color: Color(0xFF70B4EB),
                                      fontSize: 20,
                                      fontWeight: FontWeight
                                          .w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Coaching",
                              style: TextStyle(
                                  color: Color(0xFF70B4EB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(
                                      0xFFEFCD76),
                                  radius: 15,
                                  child: Icon(Icons.play_arrow,
                                    color: Colors.white,),),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(
                                      color: Color(0x0FFEFCD76),
                                      fontSize: 20,
                                      fontWeight: FontWeight
                                          .w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Positive Videos",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}