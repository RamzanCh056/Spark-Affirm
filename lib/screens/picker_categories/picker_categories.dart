import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/custom_round_card.dart';

class PickerCategories extends StatefulWidget {
  const PickerCategories({Key? key}) : super(key: key);

  @override
  State<PickerCategories> createState() => _PickerCategoriesState();
}

class _PickerCategoriesState extends State<PickerCategories> {
  List quotes = [
    "I don’t compare myself\nto others. The only\nperson I compare",
    "I am turning DOWN the\nvolume of negativity\nin my life",
    "One small positive\nthought in the morning\ncan change my whole",
    "I set goals and go after\nthem with all the\ndetermination I can",
    "I am turning DOWN the\nvolume of negativity\nin my life",
    "I set goals and go after\nthem with all the\ndetermination I can",
    "I am turning DOWN the\nvolume of negativity\nin my life",
    "I set goals and go after\nthem with all the\ndetermination I can",
  ];
  List icon = [
    Icons.favorite,
    Icons.favorite,
    Icons.favorite_border,
    Icons.favorite_border,
    Icons.favorite_border,
    Icons.favorite,
    Icons.favorite_border,
    Icons.favorite
  ];

  List images = [
    "images/Rectangle 2897.png",
    "images/Rectangle 2898.png",
    "images/Rectangle 2901.png",
    "images/Rectangle 2902.png",
    "images/Rectangle 2905.png",
    "images/Rectangle 2906.png",
    "images/Rectangle 2909.png",
    "images/Rectangle 2910.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: InkWell(
                          onTap: (){
                           Get.back(

                           );
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Center(
                        child: Text(
                      'Favorite',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) {
                      return CustomRoundCard(
                        title: quotes[index],
                        image: images[index],
                        child: Icon(
                          icon[index],
                          color: Colors.white,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
