import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:once/screens/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/header_card.dart';
import '../common/round_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _reminder = true;
  bool _notification = true;
  bool _recap = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCard(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'Notifications',
              subTitle: 'Setup your daily notifications\nto fit your routine',
              icon: 'images/notification.svg',
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('images/Vec.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Daily affirmations reminder ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                          value: _reminder,
                          activeColor: blueColor,
                          onChanged: (v) {
                            setState(() {
                              _reminder = v;
                            });
                          })
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "How many?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: blackColor),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "5x",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Start at",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: blackColor),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "9:00",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "End at",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: blackColor),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "10:00",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      Spacer(),
                      Text(
                        "General",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward_ios_outlined,color: blackColor,)
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SvgPicture.asset('images/bed.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Bedtime Notification",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                          value: _notification,
                          activeColor: blueColor,
                          onChanged: (v) {
                            setState(() {
                              _notification = v;
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "When?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: blackColor),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                            "10:00",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RoundButton(
                          onTap: () {},
                          color: lightGreyColor,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [

                      Text(
                        "Link Todays Recap",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                          value: _recap,
                          activeColor: blueColor,
                          onChanged: (v) {
                            setState(() {
                              _recap = v;
                            });
                          })
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
