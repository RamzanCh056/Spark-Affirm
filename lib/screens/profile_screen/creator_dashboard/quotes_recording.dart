import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant.dart';
import 'all_screen.dart';
import 'components/dashboard_header.dart';

class QuoteRecording extends StatelessWidget {
  const QuoteRecording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              DashboardHeader(
                title: 'Quote Recording ',
                subTitle: '450 / 483',
                child: SvgPicture.asset("images/quo.svg",height: 30,width: 30,color: orangeColor,),
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
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TabBar(
                          labelColor: whiteColor,
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 25),
                          unselectedLabelColor: blackColor,
                          labelStyle: TextStyle(fontWeight: FontWeight.w500),
                          indicator: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          tabs: [
                            Tab(
                              text: 'All',
                            ),
                            Tab(
                              text: 'Completed',
                            ),
                            Tab(
                              text: 'Incomplete',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Expanded(child: TabBarView(
                        children: [
                          AllScreen(),
                          Container(),
                          Container(),
                        ],
                      ),),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
