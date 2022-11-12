import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.indigo[400],
          cardColor: Colors.white,
          // used for field backgrounds
          backgroundColor: Colors.indigo[100],
          // color outside the card
          primaryColor: Colors.teal,
          // color of page header
          buttonColor: Colors.lightBlueAccent[100],
          // background color of buttons
          textTheme: TextTheme(
            button: TextStyle(color: Colors.deepPurple[900]), // button text
            subtitle1: TextStyle(color: Colors.grey[800]), // input text
            headline6: TextStyle(color: Colors.white), // card header text
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle:
                TextStyle(color: Colors.indigo[400]), // style for labels
          ),
        ),
        child: CardSettings(
          children: [
            CardSettingsSection(
              header: CardSettingsHeader(
                label: 'Notification',
                color: Color(0xFF5C6BC0),
              ),
              children: [
                CardSettingsInt(
                  label: 'per Day',
                ),
                CardSettingsTimePicker(
                  label: 'Start',
                ),
                CardSettingsTimePicker(
                  label: 'End',
                ),
                CardSettingsSelectionPicker(
                  items: [
                    Text("A"),
                    Text("A"),
                    Text("A"),
                    Text("A"),
                  ],
                  label: ' Categories',
                  initialItem: 'item',
                )
              ],
            ),
            CardSettingsSection(
              header: CardSettingsHeader(
                label: 'Presentation',
                color: Color(0xFF5C6BC0),
              ),
              children: [
                CardSettingsInstructions(
                  text: 'Settings that adjust presentations',
                  textColor: Colors.black,
                ),
                CardSettingsListPicker(
                  items: [Text("gd")],
                  label: 'Background',
                  initialItem: 'A',
                ),
                CardSettingsListPicker(
                  items: [Text("gd")],
                  label: 'Style',
                  initialItem: 'A',
                ),
              ],
            ),
            CardSettingsSection(
              header: CardSettingsHeader(
                label: 'Creator',
                color: Color(0xFF5C6BC0),
              ),
              children: [
                CardSettingsInstructions(
                  text: ' Current Selected Creator',
                  textColor: Colors.black,
                ),
                CardSettingsListPicker(
                  items: [Text("gd")],
                  label: 'Creator',
                  initialItem: 'A',
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
