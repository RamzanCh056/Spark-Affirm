import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final Widget? quotesNo;

  const CustomImage({
    Key? key,
    this.image,
    this.quotesNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  height: 100,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/quoteimage.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: 7,
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('images/quoteimage.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(image!), fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: quotesNo,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}