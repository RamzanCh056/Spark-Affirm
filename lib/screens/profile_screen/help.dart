import 'package:flutter/material.dart';
import 'package:once/screens/common/header_card.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCard(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'Help',
              subTitle: 'Help & Support on using the App',
              icon: 'images/help.svg',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Using the App',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Setting reminders or  notifications",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Setting reminders or  notifications",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Setting reminders or  notifications",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
