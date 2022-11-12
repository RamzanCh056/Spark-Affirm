import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
class HeaderCard extends StatelessWidget {
  final VoidCallback ? onTap;
  final String ? title;
  final String ? subTitle;
  final String ? icon;
  const HeaderCard({
    Key? key, this.onTap, this.title, this.subTitle, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: blueColor,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: onTap,
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
              child: SvgPicture.asset(icon!,height: 30,width: 30,color: blueColor,),
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

        ],
      ),
    );
  }
}