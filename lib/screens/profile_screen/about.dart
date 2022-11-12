import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/header_card.dart';
import '../constant.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Column(children: [
      HeaderCard(
        onTap: (){
          Navigator.pop(context);
        },
        title: 'About',
        subTitle: 'About the app',
        icon: 'images/about.svg',
      ),
      SizedBox(height: 120,),
      Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(30),),
        child: Center(
          child: SvgPicture.asset('images/qmark.svg',height: 30,width: 30,color: whiteColor,),
        ),
      ),
      SizedBox(height: 20,),
      Text("Version: 0.04")
    ],),),);
  }
}
