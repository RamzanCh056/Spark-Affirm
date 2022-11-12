import 'package:flutter/material.dart';
import 'package:once/screens/constant.dart';

import '../common/round_button.dart';

class Standard extends StatelessWidget {
  const Standard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  RoundButton(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    color: lightGreyColor,
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Standard",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 150,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/cov.png'),fit: BoxFit.cover),),
                child: Text(
                  "I don’t compare myself to others. The only person I compare myself to is the person I was yesterday. And as long as the person I am today",
                style: TextStyle(color: whiteColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text('Refresh frequency',style: TextStyle(fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('Every hour',style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward_ios_outlined,size: 20,color: blackColor,)

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Category',style: TextStyle(fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('General +2',style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward_ios_outlined,size: 20,color: blackColor,)

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Theme',style: TextStyle(fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('Safari',style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward_ios_outlined,size: 20,color: blackColor,)

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Font',style: TextStyle(fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('Modern',style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward_ios_outlined,size: 20,color: blackColor,)

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Creator',style: TextStyle(fontWeight: FontWeight.w500),),
                  Spacer(),
                  Text('QuietWhisper',style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward_ios_outlined,size: 20,color: blackColor,)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
