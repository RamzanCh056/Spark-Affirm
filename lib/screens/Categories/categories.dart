import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';
void Categories(BuildContext context){
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25),),
    ),
      context: context,
      builder: (_){
    return DefaultTabController(
      length: 3,
      child: FractionallySizedBox(
        heightFactor: 0.88,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25),),
            gradient: LinearGradient(colors: [Color(0xFFE2EFFF),Color(0xFFFDFAFF),],),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 35,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFB9C9DA),),
                      child: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  tabs: [
                    Tab(text: 'Categories',),
                    Tab(text: 'Themes',),
                    Tab(text: 'Sounds',),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: TabBarView(children: [
                  ListView(
                    children: [
                      Text('Trending',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(image: 'images/popular.svg',title: 'Popular',),
                          CategoryCard(image: 'images/quiet.svg',title: 'Popular',),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(image: 'images/powerful.svg',title: 'Popular',),
                          CategoryCard(image: 'images/calm.svg',title: 'Popular',),

                        ],
                      ),
                      SizedBox(height: 15,),
                      Text('Relationships',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(image: 'images/popular.svg',title: 'Popular',),
                          CategoryCard(image: 'images/popular.svg',title: 'Popular',),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(image: 'images/powerful.svg',title: 'Popular',),
                          CategoryCard(image: 'images/calm.svg',title: 'Popular',),

                        ],
                      ),
                      SizedBox(height: 15,),
                      Text('Family',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(image: 'images/popular.svg',title: 'Popular',),
                          CategoryCard(image: 'images/popular.svg',title: 'Popular',),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryCard(image: 'images/powerful.svg',title: 'Popular',),
                          CategoryCard(image: 'images/calm.svg',title: 'Popular',),

                        ],
                      ),
                    ],
                  ),
                  Container(),
                  Container(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

class CategoryCard extends StatelessWidget {
  final String ? image;
  final String ? title;
  const CategoryCard({
    Key? key, this.image, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SvgPicture.asset(image!),
        SizedBox(width: 10,),
        Text(title!,style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),)
      ],),
    );
  }
}