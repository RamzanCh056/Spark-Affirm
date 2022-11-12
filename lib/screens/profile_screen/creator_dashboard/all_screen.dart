import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:once/screens/profile_screen/creator_dashboard/quote_recording_second_screen.dart';
import '../../constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/dot_border.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Get.to(
                      ()=>QuoteRecordingSecondScreen(),
                  duration: Duration(milliseconds: 300),
                  transition: Transition.rightToLeft

              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: pinkColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I am happy with the world & the world gives happiness back to me",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('images/prr.png'),fit: BoxFit.fill,
                            )
                          ),
                        child: Icon(Icons.play_arrow,size: 40,color: whiteColor,),
                          ),
                      DotBorder(
                        child: SvgPicture.asset('images/video.svg',color: greyColor,),
                      ),
                      DotBorder(
                        child: SvgPicture.asset('images/video.svg',color: greyColor,),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A River of compassion washes away\nmy anger and replaces it with love",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(3, (index) => Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage('images/prr.png'),fit: BoxFit.fill,
                          )
                      ),
                      child: Icon(Icons.play_arrow,size: 40,color: whiteColor,),
                    ),),
                    Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I let go of worries that drain\nmy energy",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage('images/prr.png'),fit: BoxFit.fill,
                          )
                      ),
                      child: Icon(Icons.play_arrow,size: 40,color: whiteColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All of my problems have a solution",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage('images/prr.png'),fit: BoxFit.fill,
                          )
                      ),
                      child: Icon(Icons.play_arrow,size: 40,color: whiteColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I am happy with the world & the world gives happiness back to me",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage('images/prr.png'),fit: BoxFit.fill,
                          )
                      ),
                      child: Icon(Icons.play_arrow,size: 40,color: whiteColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I am happy with the world & the world gives happiness back to me",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage('images/prr.png'),fit: BoxFit.fill,
                          )
                      ),
                      child: Icon(Icons.play_arrow,size: 40,color: whiteColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    DotBorder(
                      child: SvgPicture.asset('images/video.svg',color: greyColor,),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}


