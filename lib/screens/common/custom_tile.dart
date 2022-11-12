import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:once/screens/constant.dart';
class CustomTile extends StatelessWidget {
  final String ? image;
  final String ? title;
  final VoidCallback ? onTap;
  const CustomTile({
    Key? key, this.image, this.title, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: SvgPicture.asset(image!,height: 20,width: 20,)),
            SizedBox(width: 20,),
            Expanded(
              flex: 10,
                child: Text(title!,style: TextStyle(fontWeight: FontWeight.w400,color: blackColor),))
          ],
        ),
      ),
    );
  }
}