import 'package:app_e_commerce_project/Ui/Utils/my_assets.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:app_e_commerce_project/Ui/home/product_details/cubit/product_details_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/product_details/cubit/product_states.dart';
import 'package:app_e_commerce_project/data/model/response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';


class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'product_detail_view';

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return BlocProvider(
      create: (context) => ProductDetailsViewModel()..getAllProducts(),
      child: BlocBuilder<ProductDetailsViewModel, ProductDetailsStates>(
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsSuccessState) {
            final productResponse = state.productResponse;
            final product = productResponse.data!.first;
            return Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                title: const Text('Product Details'),
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.primaryColor,
                titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_checkout_outlined),
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: AppColors.greyColor, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: ImageSlideshow(
                            initialPage: 0,
                            indicatorColor: AppColors.primaryColor,
                            indicatorBackgroundColor: AppColors.whiteColor,
                            indicatorBottomPadding: 20.h,
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: product.images!.map((url) =>
                                Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                  height: 300.h,
                                  width: double.infinity,
                                )
                            ).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product.title ?? "",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.darkPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "EGP ${product.price}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.darkPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(color: AppColors.primaryColor, width: 1),
                                  ),
                                  child: Text(
                                    'sold:${product.sold}',
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: AppColors.darkPrimaryColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Image.asset(MyAssets.starIcon),
                                SizedBox(width: 4.w),
                                Text(
                                  '${product.ratingsAverage}',
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.darkPrimaryColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 28.sp,
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 28.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'description',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ReadMoreText(
                        product.description ?? "",
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor.withOpacity(0.6),
                        ),
                        trimCollapsedText: 'show more',
                        trimExpandedText: 'show less',
                        moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkPrimaryColor,
                        ),
                        lessStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(height: 120.h),
                      Row(
                        children: [
                          Text(
                            "Total price",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "EGP${product.price}",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 32.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.add_shopping_cart_outlined),
                              Text(
                                "Add to cart",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ProductDetailsErrorState) {
            return Center(child: Text('Error: ${state.errorMsg}'));
          } else {
            return Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}
