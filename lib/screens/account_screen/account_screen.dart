import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            accentColor: Colors.indigo[400],
          cardColor: Colors.white, // used for field backgrounds
          backgroundColor: Colors.indigo[100], // color outside the card
          primaryColor: Colors.teal, // color of page header
          buttonColor: Colors.lightBlueAccent[100], // background color of buttons
          textTheme: TextTheme(
            button: TextStyle(color: Colors.deepPurple[900]), // button text
            subtitle1: TextStyle(color: Colors.grey[800]), // input text
            headline6: TextStyle(color: Colors.white), // card header text
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.indigo[400]), // style for labels
          ),
        ),
        child: CardSettings(
          children: [
            CardSettingsSection(
              header: CardSettingsHeader(
                label: 'Basis Info',
                color: indigoColor,
              ),
              children: [

                CardSettingsText(label: 'Full Name',),
                CardSettingsButton(onPressed: (){},label: 'Avatar',),

              ],
            ),
            CardSettingsSection(
              header: CardSettingsHeader(
                label: 'Security',
                color: Color(0xFF5C6BC0),
              ),
              children: [
                CardSettingsEmail(label: 'Email',),
                CardSettingsPassword(label: 'Password',)
              ],
            )

          ],
        ),
      ),
    );
  }
}
