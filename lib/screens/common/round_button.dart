import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback ? onTap;
  final Widget ? child;
  final Color ? color;
  const RoundButton({
    Key? key, this.onTap, this.child, this.color ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: child
        ),
      ),
    );
  }
}