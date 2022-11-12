import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:once/screens/profile_screen/creator_dashboard/components/dot_border.dart';
import 'package:once/screens/profile_screen/creator_dashboard/record_screen.dart';

import '../../constant.dart';
import 'components/dashboard_header.dart';

class QuoteRecordingSecondScreen extends StatelessWidget {
  const QuoteRecordingSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            DashboardHeader(
              title: 'Creator Dashboard ',
              subTitle: 'ID: 129030',
              child: SvgPicture.asset(
                "images/quo.svg",
                height: 30,
                width: 30,
                color: orangeColor,
              ),
            ),
            Positioned(
              top: 220,
              left: 100,
              child: Text(
                'Quote Type: Simple Quote',
                style:
                    TextStyle(fontWeight: FontWeight.w400, color: whiteColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 260),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage('images/Rectangle 2977.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        "I am happy with the world &\nthe world gives happiness\nback to me",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Liked videos",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...List.generate(
                    3,
                    (index) => Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          index == 1
                              ? DotBorder(
                                  child: SvgPicture.asset(
                                    'images/video.svg',
                                    color: greyColor,
                                  ),
                                )
                              : Container(
                                  height: 60,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage('images/prr.png'),
                                        fit: BoxFit.fill,
                                      )),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 40,
                                    color: whiteColor,
                                  ),
                                ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Say it once",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Record video saying it once",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: greyColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      RecordScreen(context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: blackColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Record",
                                          style: TextStyle(color: whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SvgPicture.asset('images/upload.svg'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
