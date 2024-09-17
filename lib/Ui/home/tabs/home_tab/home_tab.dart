import 'package:app_e_commerce_project/Ui/Utils/my_assets.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/widgets/categories_or_brands_secion.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/widgets/row_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/announcement_section.dart';

class HomeTab extends StatelessWidget {
HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrands(),
      builder: (context,state){
        return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(MyAssets.logo,
                      color: AppColors.primaryColor,),
                    SizedBox(height: 18.h,),
                    CustomSearchWithShoppingCart(),
                    SizedBox(height: 16.h,),
                    AnnouncementSection(),
                    SizedBox(height: 16.h,),
                    RowSectionWidget(name:'Categories'),
                    SizedBox(height:24.h
                    ),
                    state is HomeCategoryLoadingState?
                    Center(child: CircularProgressIndicator(),)
                            : state is HomeBrandsSuccessState?
                    CategoriesOrBrandsSecion(list:viewModel.categoriesList):
                        Center(child: Text('Error loading categories'),),
                    SizedBox(
                        height:24.h
                    ),
                    RowSectionWidget(name:'Brands'),
                    SizedBox(height:24.h),
                    viewModel.brandsList.isEmpty?
                     Center(child: CircularProgressIndicator(
                       color: AppColors.primaryColor,
                     ),)
                        :
                    CategoriesOrBrandsSecion(list: viewModel.brandsList)

                  ],
                ),
              ),
            ));
      },

    );
  }
}
