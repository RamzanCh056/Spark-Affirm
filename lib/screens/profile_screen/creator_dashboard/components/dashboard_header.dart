import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constant.dart';

class DashboardHeader extends StatelessWidget {
  final Widget ? child;
  final String ? title;
  final String ? subTitle;
  final Color ? topColor;
  final Color ? bottomColor;
  const DashboardHeader({Key? key, this.child, this.title, this.subTitle, this.topColor, this.bottomColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFAAE5B),Color(0xFFF19943)]),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(30),),
            child: Center(
              child: child,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: whiteColor),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subTitle!,textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: whiteColor),
          ),
          SizedBox(height: 30,)

        ],
      ),
    );
  }
}
