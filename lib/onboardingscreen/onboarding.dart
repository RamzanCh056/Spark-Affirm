import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:once/AuthFlutterFire/signin_screen.dart';

import 'package:introduction_screen/introduction_screen.dart';

class Onbording extends StatelessWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
              bodyWidget: Center(
                child: Text(
                  "Easy Qutations",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.indigo, fontSize: 20, shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]),
                ),
              ),
              image: Image.asset("images/onboardone.png"),
              footer: Text(
                "EASY TO SPOKE",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                ),
              ),
              titleWidget: Text(
                "AFFORDABLE",
                style: TextStyle(fontSize: 30, color: Colors.indigo),
              )),
          PageViewModel(
            titleWidget: Text("ON-Time",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                )),
            bodyWidget: Center(
              child: Text(
                "PIC PLUS VIDEO",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo, fontSize: 20, shadows: [
                  Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  )
                ]),
              ),
            ),
            image: Image.asset(
              "images/onboardtwo.png",
              width: double.infinity,
            ),
            footer: Text(
              "EASY TO UNDERSTAND QUTATIONS",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
              ),
            ),
          ),
          PageViewModel(
              titleWidget: Text("NOT EXPENSIVE",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                  )),
              bodyWidget: Center(
                child: Text(
                  "Fully Verified",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.indigo, fontSize: 20, shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]),
                ),
              ),
              image: Image.asset("images/onboardthree.png")),
        ],
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
          print("Done is clicked");
        },
        showSkipButton: true,
        showNextButton: true,
        nextFlex: 1,
        dotsFlex: 2,
        // skipFlex: 1,
        skipOrBackFlex: 1,
        animationDuration: 1000,
        curve: Curves.fastOutSlowIn,
        dotsDecorator: DotsDecorator(
            spacing: EdgeInsets.all(5),
            color: Colors.indigo,
            // activeSize: Size.square(10),
            // size: Size.square(5),
            activeSize: Size(20, 10),
            size: Size.square(10),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        skip: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: Offset(4, 4))
              ]),
          child: Center(
            child: Text(
              "Skip",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        next: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.indigo, width: 2)),
          child: Center(
            child: Icon(
              Icons.navigate_next,
              size: 30,
              color: Colors.indigo,
            ),
          ),
        ),
        done: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 40,
                    offset: Offset(4, 4))
              ]),
          child: Center(
            child: Text(
              "Done",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ));
  }
}
