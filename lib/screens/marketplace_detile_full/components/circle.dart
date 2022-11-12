import 'package:flutter/material.dart';
class Cirlcle extends StatelessWidget {
  final String ? image;
  final String ? message;
  const Cirlcle({
    Key? key, this.image, this.message,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage:
            AssetImage(image!),
            child: Center(
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black)),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.black)),
                    child: Center(
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                Colors.black)),
                        child: Center(
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape:
                                BoxShape.circle,
                                border: Border.all(
                                    color: Colors
                                        .black)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message!,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}