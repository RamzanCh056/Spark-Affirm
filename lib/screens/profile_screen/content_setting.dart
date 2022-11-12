import 'package:flutter/material.dart';
import 'package:once/screens/common/custom_tile.dart';
import 'package:once/screens/common/header_card.dart';

class ContentSetting extends StatelessWidget {
  const ContentSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderCard(
              title: "Content Settings",
              subTitle: 'Customize how\ncontent is presented',
              icon: 'images/content.svg',
              onTap: (){
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20,),
            CustomTile(
              image: 'images/content.svg',
              title: 'Player Options',
            ),
            CustomTile(
              image: 'images/grid.svg',
              title: 'Preferred Categories ',

            ),
          ],
        ),
      ),
    );
  }
}
