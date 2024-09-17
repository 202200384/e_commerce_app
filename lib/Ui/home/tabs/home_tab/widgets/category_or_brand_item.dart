import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:app_e_commerce_project/data/model/response/CategoryOrBrandResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrand category;
  CategoryOrBrandItem({required this.category});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child:CachedNetworkImage(
              height: 100.h,
               width: 100.w,
               fit: BoxFit.cover,
               imageUrl: category.image??"",
               placeholder: (context, url) =>
                 const Center(child: CircularProgressIndicator(
                   color: AppColors.primaryColor,
                 )),
               errorWidget: (context, url, error) =>
                   const Center(child:Icon(Icons.error) ,),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }
             ),

            ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child:Text(category.name??"",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.darkPrimaryColor,
              fontWeight: FontWeight.normal
            ),)),
      ],
    );
  }
}
