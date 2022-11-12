import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';
class DotBorder extends StatelessWidget {
  final Widget ? child;
  const DotBorder({
    Key? key, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: greyColor,
        dashPattern: [10,4],
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12),),
          child: Center(child: child,),
        ),
      ),
    );
  }
}