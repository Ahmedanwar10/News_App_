import 'package:flutter/material.dart';
import 'package:news_app_/model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  CategoryItem(this.category , this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: index%2==0 ? Radius.zero: Radius.circular(30),
          bottomLeft: index%2==0? Radius.circular(30):Radius.zero
        )
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: 100,
            width: 100,
          ),
          SizedBox(height: 10),
          Text(
            category.title,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
