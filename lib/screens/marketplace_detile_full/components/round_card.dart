import 'package:flutter/material.dart';
class RoundCard extends StatelessWidget {
  final String? image;
  final String? title;

  const RoundCard({
    Key? key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 210,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration:
        BoxDecoration(image: DecorationImage(image: AssetImage(image!))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: Text(
              title!,
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        ));
  }
}