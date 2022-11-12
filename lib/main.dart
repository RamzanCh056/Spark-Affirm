import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:once/Auth/login_screen.dart';
import 'package:once/AuthFlutterFire/signin_screen.dart';
import 'package:once/Navbar/navbarr.dart';
import 'package:once/landing%20Page/landing_page.dart';
import 'package:once/onboardingscreen/onboarding.dart';
import 'package:once/screens/library_nosubcription_screen/library_nosubcription_screen.dart';
import 'package:once/screens/tab_marketplace/tab_marketplace.dart';
import 'package:once/screens/tab_quotes_screen/tab_quotes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:once/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences preferences;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  void initstate() {
    super.initState();
    navigationPage();
  }

  navigationPage() {
    SharedPreferences.getInstance().then((value) async {
      preferences = value;
      if (preferences.getBool('isLoggedIn') ?? false) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => NavigationBarr()),
              (route) => false);
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => Onbording()), (route) => false);
        });
      }
    }).catchError((e) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Onbording()), (route) => false);
      });
    });
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          //    check for errors
          if (snapshot.hasError) {
            print('Somthing went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            print('firebase connected');
          }
          return GetMaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: LandingPage(),
          );
        });
  }
}
