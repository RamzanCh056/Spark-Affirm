import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  late ExpandedTileController _controller;
  late ExpandedTileController subController;
  late ExpandedTileController helpController;
  late ExpandedTileController slideController;
  late ExpandedTileController profileController;
  late ExpandedTileController libraryController;


  void initState() {

    _controller = ExpandedTileController(isExpanded:false);
    subController= ExpandedTileController(isExpanded:false);
    helpController= ExpandedTileController(isExpanded:false);
    slideController= ExpandedTileController(isExpanded:false);
    profileController= ExpandedTileController(isExpanded:false);
    libraryController= ExpandedTileController(isExpanded:false);
    super.initState();
  }

  bool trail = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        children: [
          Container(
            height: 80,
            color: Colors.blue.shade300,
            child: Center(child: Row(
              children: [
                SizedBox(width: 12,),
                Text('Profile Menu', style: TextStyle(color: Colors.white, fontSize: 18),),
              ],
            )),
          ),
          ListTile(
            tileColor: Colors.grey.shade300,
            title: Text(
              "User Section",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ExpandedTile(
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
                  contentBackgroundColor:Color(0xFFF9F3F2)
              // contentPadding: EdgeInsets.all(24.0),
                //FDF9F8

            ),
            controller: _controller,
            title: const Text("Account"),
            leading: Icon(Icons.person_outline, color: Colors.grey,),
            content: Column(children: [
              ListTile(
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                title: Text('Info',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Password',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),


          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
                contentBackgroundColor:Color(0xFFF9F3F2)

            ),
            controller: subController,
            title: const Text("Subscription"),
            leading: Icon(Icons.subscriptions_outlined,color: Colors.grey,),
            content: Column(children: [
              ListTile(
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                title: Text('Settings',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Billing',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),

          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
                contentBackgroundColor:Color(0xFFF9F3F2)
            ),
            controller: helpController,
            title: const Text("Help and Request"),
            leading: Icon(Icons.help_center_outlined,color: Colors.grey,),
            content: Column(children: [
              ListTile(
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                title: Text('Help',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Contact ',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Request a feature',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Request a Creator',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),

          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("SlideShow Settings"),
            leading: Icon(Icons.settings_outlined,color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(  leading: Icon(Icons.settings_outlined,color: Colors.grey,),
          //   title: Text('SlideShow Settings',
          //       style: TextStyle(
          //         // height: 1,
          //         // color: Colors.white,
          //       ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("Notification Settings"),
            leading: Icon(Icons.notifications_outlined,color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("About"),
            leading: Icon(Icons.info_outline,color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(  leading: Icon(Icons.info_outline,color: Colors.grey,),
          //   title: Text('About',
          //     style: TextStyle(
          //       // height: 1,
          //       // color: Colors.white,
          //     ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("Became a Creator"),
            leading: Icon(Icons.inventory_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
         // SizedBox(height: 10,),
          ListTile(
            tileColor: Colors.grey.shade300,
            title: Text(
              "Creator Section",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ExpandedTile(
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
                contentBackgroundColor:Color(0xFFF9F3F2)
            ),
            controller: profileController,
            title: const Text("Profile"),
            leading: Icon(Icons.person_pin_outlined,color: Colors.grey,),
            content: Column(children: [
              ListTile(
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                title: Text('Info',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Aviator',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),


          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
                contentBackgroundColor:Color(0xFFF9F3F2)

            ),
            controller: libraryController,
            title: const Text("Content Library"),
            leading: Icon(Icons.verified_outlined,color: Colors.grey,),
            content: Column(children: [
              ListTile(
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios,size: 18,),
                title: Text('Affirmations',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Coaching',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
              Divider(
                thickness: 1,
              ),
              ListTile(
                // tileColor: Colors.white,
                dense: true,
                minLeadingWidth: 18,
                horizontalTitleGap: 8,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),

                trailing: Icon(Icons.arrow_forward_ios, size: 18,),
                title: Text('Positive Videos',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      // color: Colors.white,
                    )),),
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),

          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
                contentBackgroundColor:Color(0xFFF9F3F2)

            ),
            controller: slideController,
            title: const Text("Analytics"),
            leading: Icon(Icons.analytics_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
         
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("Income"),
            leading: Icon(Icons.monetization_on_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(  leading: Icon(Icons.monetization_on_outlined, color: Colors.grey,),
          //   title: Text('Income',
          //     style: TextStyle(
          //       // height: 1,
          //       // color: Colors.white,
          //     ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("Payment"),
            leading: Icon(Icons.payment_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(  leading: Icon(Icons.payment_outlined, color: Colors.grey,),
          //   title: Text('Payment',
          //     style: TextStyle(
          //       // height: 1,
          //       // color: Colors.white,
          //     ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),

          ListTile(
            tileColor: Colors.grey.shade300,
            title: Text(
              "Admin Section",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("App Setting"),
            leading: Icon(Icons.app_settings_alt_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(  leading: Icon(Icons.app_settings_alt_outlined, color: Colors.grey,),
          //   title: Text('App Setting',
          //     style: TextStyle(
          //       // height: 1,
          //       // color: Colors.white,
          //     ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("App Values"),
            leading: Icon(Icons.settings_applications_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(  leading: Icon(Icons.settings_applications_outlined, color: Colors.grey,),
          //   title: Text('App Values',
          //     style: TextStyle(
          //       // height: 1,
          //       // color: Colors.white,
          //     ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          ExpandedTile(
            enabled: false,
            theme: const ExpandedTileThemeData(
              headerColor: Colors.white,
              contentBackgroundColor: Colors.white,
              // contentPadding: EdgeInsets.all(24.0),

            ),
            controller: slideController,
            title: const Text("Activity Log"),
            leading: Icon(Icons.local_activity_outlined, color: Colors.grey,),
            content: Column(children: [
            ],),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("long tapped!!");
            },
          ),
          // ExpansionTile(
          //
          //   leading: Icon(Icons.local_activity_outlined, color: Colors.grey,),
          //   title: Text('Activity Log',
          //     style: TextStyle(
          //       // height: 1,
          //       // color: Colors.white,
          //     ),
          //
          //   ),
          //   trailing: Icon(Icons.arrow_forward_ios, size: 16,),
          // ),
          Divider(
            thickness: 1,
            height: 0,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
