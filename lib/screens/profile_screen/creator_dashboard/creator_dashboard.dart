import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:once/screens/common/custom_tile.dart';
import 'package:once/screens/constant.dart';
import 'quotes_recording.dart';
import 'components/dashboard_header.dart';

class CreatorDashBoard extends StatelessWidget {
  const CreatorDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(

          child: Column(
            children: [
              Stack(
                children: [
                  DashboardHeader(
                    title: 'Creator Dashboard ',
                    subTitle: '@QuiteWhispers',
                    child: Image.asset("images/Rectangle 2949.png",fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 250),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        CustomTile(
                          trailing: "",
                          title: 'Profile',
                          image: 'images/user.svg',
                        ),
                        CustomTile(
                          trailing: "",
                          title: 'Account',
                          image: 'images/accounti.svg',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                          child: Text("Content",style: TextStyle(fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset('images/quo.svg',height: 20,width: 20,),
                              SizedBox(width: 20,),
                              Text('Quotes Recordings',style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),),
                              Spacer(),
                              Text("483 / 483",style: TextStyle(color: greyColor),),
                              SizedBox(width: 10,),
                              InkWell(
                                  onTap: (){
                                    Get.to(
                                        ()=> QuoteRecording(),
                                        duration: Duration(milliseconds: 300),
                                        transition: Transition.rightToLeft
                                    );
                                  },
                                  child: Icon(Icons.arrow_forward_ios_outlined,size: 20,))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset('images/coaching.svg',height: 20,width: 20,),
                              SizedBox(width: 20,),
                              Text('Coaching Recordings',style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),),
                              Spacer(),
                              Text("0 / 80",style: TextStyle(color: greyColor),),
                              SizedBox(width: 10,),
                              Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset('images/Vec.svg',height: 20,width: 20,),
                              SizedBox(width: 20,),
                              Text('Positive Recordings',style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),),
                              Spacer(),
                              Text("0 / 5",style: TextStyle(color: greyColor),),
                              SizedBox(width: 10,),
                              Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset('images/cstatus.svg',height: 20,width: 20,),
                              SizedBox(width: 20,),
                              Text('Content Status',style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),),
                              Spacer(),
                              Text("Version 0.0.9",style: TextStyle(color: greyColor),),
                              SizedBox(width: 10,),
                              Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                          child: Text("Subscribers",style: TextStyle(fontWeight: FontWeight.w500),),
                        ),
                        CustomTile(
                          trailing: "",
                          title: 'Subscribers',image: 'images/unlock.svg',),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                          child: Text("Income",style: TextStyle(fontWeight: FontWeight.w500),),
                        ),
                        CustomTile(
                          trailing: "",
                          title: 'Subscribers',image: 'images/income.svg',),

                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
