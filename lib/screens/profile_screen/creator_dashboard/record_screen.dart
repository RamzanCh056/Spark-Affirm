import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant.dart';

void RecordScreen(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.95,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                Image.asset('images/back.jpg'),
                Positioned(
                  left: 20,
                  top: 20,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 400),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        "Say it once",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500,color: blackColor),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "I am happy with the world & the world\ngives happiness back to me ",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400,color: blackColor),
                      ),
                      Spacer(),
                      SvgPicture.asset('images/circle-dot.svg'),
                      SizedBox(height: 10,),
                      Text("Record",style: TextStyle(color: greyColor),),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}