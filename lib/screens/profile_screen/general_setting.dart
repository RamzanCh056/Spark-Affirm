import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:once/screens/common/header_card.dart';

import '../constant.dart';
class GeneralSetting extends StatefulWidget {
  const GeneralSetting({Key? key}) : super(key: key);

  @override
  State<GeneralSetting> createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  bool _splash = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          HeaderCard(
            onTap: (){
              Navigator.pop(context);
            },
            title: 'General Settings',
            subTitle: 'Manage Settings for\nyour experience',
            icon: 'images/set.svg',
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [

                Text(
                  "Show SplashScreen",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: blackColor),
                ),
                Spacer(),
                CupertinoSwitch(
                    value: _splash,
                    activeColor: blueColor,
                    onChanged: (v) {
                      setState(() {
                        _splash = v;
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
