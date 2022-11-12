import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuitWhisperCard extends StatelessWidget {
  final String? image;
  final VoidCallback? onPressed;

  const QuitWhisperCard({
    Key? key,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image!,
                height: 80,
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "QuietWhispers",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 48,),
                      MaterialButton(
                        height: 30,
                        onPressed: onPressed,
                        color: Color(0xFFE8E8E8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "\$ 3.99",
                          style: TextStyle(color: Color(0xFF229DFF)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/youtube.svg',
                        color: Color(0xFFC4C4C4),
                        height: 13,
                        width: 13,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        height: 13,
                        width: 13,
                        'images/instigram.svg',
                        color: Color(0xFFC4C4C4),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        height: 13,
                        width: 13,
                        'images/tiktok.svg',
                        color: Color(0xFFC4C4C4),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "34k folowers",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'images/Soundscapes.svg',
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "12",
                        style: TextStyle(
                            color: Color(0xFF70B4EB),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        'images/quotes.svg',
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "12",
                        style: TextStyle(
                            color: Color(0xFFFFBA90),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFFEFCD76),
                        radius: 10,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            color: Color(0xFF7EFCD76),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}