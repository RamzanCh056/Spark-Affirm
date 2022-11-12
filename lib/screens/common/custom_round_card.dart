import 'package:flutter/material.dart';

import '../constant.dart';

class CustomRoundCard extends StatelessWidget {
  final String? image;
  final String? title;
  final Widget? child;

  const CustomRoundCard({
    Key? key,
    this.image,
    this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 210,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: child!),
              Spacer(),
              Text(
                title!,
                style: TextStyle(fontSize: 16, color: whiteColor),
              ),
            ],
          ),
        ));
  }
}
