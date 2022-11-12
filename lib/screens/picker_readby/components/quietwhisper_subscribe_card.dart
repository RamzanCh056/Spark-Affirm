import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class QuietWhispersSubscribeCard extends StatelessWidget {
  final String ? image;
  const QuietWhispersSubscribeCard({
    Key? key, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(image!,height: 85,width: 92,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("QuietWhispers",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                  SizedBox(width: 60,),
                  Icon(Icons.done,size: 25,color: Colors.black,)
                ],

              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SvgPicture.asset('images/youtube.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                      'images/instigram.svg'),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset('images/tiktok.svg'),
                ],
              ),
              SizedBox(height: 5,),
              Text("34k followers",style: TextStyle(color: Color(0xFf4D4C4C)),)
            ],
          )
        ],
      ),
    );
  }
}