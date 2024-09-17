import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/widgets/category_or_brand_item.dart';
import 'package:app_e_commerce_project/data/model/response/CategoryOrBrandResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesOrBrandsSecion extends StatelessWidget {
     List<CategoryOrBrand> list;
     CategoriesOrBrandsSecion({required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount: list.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16),
          itemBuilder: (context,index){
          return CategoryOrBrandItem(category:list[index] ,);
          }),
    );
  }
}
