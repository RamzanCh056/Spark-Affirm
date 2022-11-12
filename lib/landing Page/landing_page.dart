import 'package:flutter/material.dart';
import 'package:once/Navbar/navbarr.dart';
import 'package:once/onboardingscreen/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late SharedPreferences preferences;
   

  void initState() {
    super.initState();
     SharedPreferences.getInstance().then((value) async {
      preferences = value;
      if (preferences.getBool('isLoggedIn') ?? false) {
        Future.delayed(const Duration(milliseconds:2 ), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => NavigationBarr()),
              (route) => false);
        });
      } else {
        Future.delayed(const Duration(milliseconds:2), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Onbording()),
              (route) => false);
        });
      }
    }).catchError((e) {
      Future.delayed(const Duration(milliseconds:2), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Onbording()),
            (route) => false);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
