import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class QuietWhispers extends StatelessWidget {
  final String ? image;
  const QuietWhispers({
    Key? key, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image!,
          height: 145,
          width: 125,
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "QuietWhispers",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "34k folowers",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF4D4C4C)),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset('images/youtube.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset('images/instigram.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset('images/tiktok.svg'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}