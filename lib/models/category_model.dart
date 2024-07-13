import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String iconpath;
  Color boxColor;
  CategoryModel(
  {
    required this.name,
    required this.iconpath,
    required this.boxColor,
});
   
  static  List<CategoryModel> getCategories(){
    List<CategoryModel> categories= [];
    categories.add(
      CategoryModel(name: 'Salad',
          iconpath: 'assests/icons/plate.svg',
          boxColor: Color(0xff92A3Fd)
      )
    );

    categories.add(
        CategoryModel(name: 'Cake',
            iconpath: 'assests/icons/pancakes.svg',
            boxColor: Color(0xffC58BF2)
        )
    );

    categories.add(
        CategoryModel(name: 'Pie',
            iconpath: 'assests/icons/pie.svg',
            boxColor: Color(0xff92A3Fd)
        )
    );

    categories.add(
        CategoryModel(name: 'Smoothies',
            iconpath: 'assests/icons/orange-snacks.svg',
            boxColor: Color(0xffC58BF2)
        )
    );
    return categories;

  }
}