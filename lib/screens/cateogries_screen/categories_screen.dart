import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../shared/style/componenets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function callback;
  CategoriesScreen(this.callback);
  List<CategoryModel> categories = [
    CategoryModel(
        title: "Sports",
        imagePath: "assets/images/sports.png",
        color: Color(0xffC91C22)),
    CategoryModel(
        title: "Politics",
        imagePath: "assets/images/Politics.png",
        color: Color(0xff003E90)),
    CategoryModel(
        title: "Health",
        imagePath: "assets/images/health.png",
        color: Color(0xffED1E79)),
    CategoryModel(
        title: "Business",
        imagePath: "assets/images/bussines.png",
        color: Color(0xffCF7E48)),
    CategoryModel(
        title: "Environment",
        imagePath: "assets/images/environment.png",
        color: Color(0xff4882CF)),
    CategoryModel(
        title: "Science",
        imagePath: "assets/images/science.png",
        color: Color(0xffF2D352)),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category of interest",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        callback(categories[index]);
                      },
                      child: CategoryItem(categories[index], index));
                },
                itemCount: categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
