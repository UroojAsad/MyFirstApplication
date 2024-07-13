import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfirstapplication/models/category_model.dart';
import 'package:myfirstapplication/models/diet_model.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getInitialInfo() {

    categories = CategoryModel.getCategories();
    diets= DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
  _getInitialInfo();
    return Scaffold(
      appBar: myappbar(),
      backgroundColor: Colors.white ,
      body: _recommendation());
    return const Placeholder();
  }

  Column _recommendation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchField(),
        SizedBox (height: 40,),
      _categorysection(),
        SizedBox(height: 40,),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Recommendation\nfor Diet',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(

              height: 240,
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return  Container(
                      width: 210,
                      decoration: BoxDecoration(
                       // color: diets[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(diets[index].iconPath),
                          Text(
                            diets[index].name,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,

                            ),
                          ),
                          Text(
                            diets[index].level + '|' + diets[index].duration + '|'+ diets[index].calories,
                            style: TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                       Container(
                            height: 45,
                            width: 130,
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                   color:  diets[index].viewIsSelected? Colors.white : Color(0xff92A3FD),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14

                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                 diets[index].viewIsSelected? Color(0xff9DCEFF) : Colors.transparent,
                                  diets[index].viewIsSelected? Color(0xff92A3FD) : Colors.transparent
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder:(context,index) => SizedBox(width: 25,) ,
                  itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
            ),
  ),
        ]

        ),
    ],
  );
  }

  Column _categorysection() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
  ),
            SizedBox(height: 15,),
            Container(
              height: 120,

              child: ListView.separated(
                itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  separatorBuilder: (context,index) => SizedBox(width: 25,),
                  itemBuilder: (context,index){
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(categories[index].iconpath),
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                                fontSize: 14
                            ),
                          )
                        ],
                      ),
                    );
                  },
              ),
            )

        ],
      );
  }

  Container searchField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20 , right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26 .withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(5),
              hintText: 'Search Pancake',
              hintStyle: TextStyle(
                color: Colors.teal,
                fontSize: 14
              ),
                prefixIcon: SizedBox(
                  height: 40,
                  width: 40,
                  child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assests/icons/search-interface-symbol_54481.svg'),

                                ),
                ),
                suffixIcon:  Container(
                 width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.1,
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assests/icons/settings_1077333.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                  borderSide:BorderSide.none

              )

            ),

          ),


        );
  }

  AppBar myappbar() {
    return AppBar(backgroundColor: Colors.white,
    title: Text('BreakFast',
    style:  TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold
    ),),
    centerTitle: true,
    leading: Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: SvgPicture.asset('assests/icons/math.svg',
        height: 20,
        width: 20,),
      decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10)
      ),
    ),
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          child: SvgPicture.asset('assests/icons/flickr-big-logo_80896.svg',
            height: 20,
            width: 20,),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10)
          ),
        )

      ],
    );
  }
}