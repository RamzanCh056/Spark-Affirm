import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:once/screens/constant.dart';
class CustomTile extends StatelessWidget {
  final String ? image;
  final String ? title;
  String? trailing;
  final VoidCallback ? onTap;
   CustomTile({
    Key? key, this.image, this.title, this.onTap,this.trailing
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(image!,height: 20,width: 20,),
            SizedBox(width: 20,),
           Expanded(child: Text(title!,style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),)),
           Text(trailing!,style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),),

          ],
        ),
      ),
    );
  }
}