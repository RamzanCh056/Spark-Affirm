import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:once/screens/library_nosubcription_screen/library_nosubcription_screen.dart';
import 'package:once/screens/tab_marketplace/tab_marketplace.dart';
import 'package:once/screens/tab_quotes_screen/tab_quotes.dart';

class NavigationBarr extends StatefulWidget {
  const NavigationBarr({Key? key}) : super(key: key);

  @override
  State<NavigationBarr> createState() => _NavigationBarrState();
}

class _NavigationBarrState extends State<NavigationBarr> {
  List<Widget> pages = [TabQuotes(), TabMarketPlace(), LibraryScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xFFFFFFFF).withOpacity(0.6),
                elevation: 0,

                //  Color(0xFF0ECEC),

                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _currentIndex == 0
                          ? 'images/quote-right.svg'
                          : 'images/quote-right-light.svg',
                      width: 20,
                      color: _currentIndex == 0 ? Colors.blue : Colors.black54,
                    ),
                    label: (""),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _currentIndex == 1
                          ? 'images/users.svg'
                          : 'images/lightusers.svg',
                      width: 30,
                      color: _currentIndex == 1 ? Colors.blue : Colors.black54,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _currentIndex == 2
                          ? 'images/rectangle-history-circle-user.svg'
                          : 'images/lightrectangle-history-circle-user.svg',
                      width: 30,
                      color: _currentIndex == 2 ? Colors.blue : Colors.black54,
                    ),
                    label: '',
                  ),
                ],

                // fixedColor: Colors.white,
                unselectedItemColor: Colors.black,

                selectedItemColor: Colors.blue,
                currentIndex: _currentIndex,

                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ));
  }
}
