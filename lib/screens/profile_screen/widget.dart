import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:once/screens/common/header_card.dart';
import 'package:once/screens/constant.dart';
import 'package:once/screens/profile_screen/standard_screen.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderCard(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'Widgets',
              subTitle: 'Customize Widgets to fit\nyour Home screen',
              icon: 'images/widgets.svg',
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: Image.asset('images/bck.png'),
              title: Text(
                "Standard",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Every hour",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: InkWell(
                onTap: (){
                  Get.to(
                          ()=> Standard(),
                      duration: Duration(milliseconds: 300),
                      transition: Transition.rightToLeft
                  );
                },
                  child: Icon(Icons.arrow_forward_ios_outlined,color: blackColor,)),
            )
          ],
        ),
      ),
    );
  }
}
