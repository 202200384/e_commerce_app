import 'package:app_e_commerce_project/Ui/Utils/my_assets.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:app_e_commerce_project/Ui/home/cart/cart_screen.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/widgets/custom_text_field.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/product_list_tab/cubit/product_tab_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/product_list_tab/widgets/grid_view_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../product_details/product_details_view.dart';

class ProductListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var viewModel = ProductTapViewModel.get(context);
    return BlocBuilder(
      bloc: viewModel..getAllProducts(),
      builder: (context,state){
        return SafeArea(
            child:Padding(
              padding:EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(MyAssets.logo,
                    color: AppColors.primaryColor
                    ,),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(children: [
                    Expanded(
                      child:CustomTextField(),),
                    SizedBox(
                      width: 24.w,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: Badge(
                        label: Text(viewModel.numOfCartItems.toString()),
                        child: ImageIcon(AssetImage(MyAssets.shoppingCart),
                          size: 28.sp,
                          color: AppColors.primaryColor,),
                      ),
                    )
                  ],),
                  SizedBox(
                    height: 24.h,
                  ),
                  viewModel.productList.isEmpty?
                  Center(child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),)
                      :
                  Expanded(child: GridView.builder(
                      itemCount: viewModel.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 6/9,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h),
                      itemBuilder:(context,index){
                        return InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: (){
                            Navigator.of(context).pushNamed(
                                ProductDetailsView.routeName,
                            arguments: viewModel.productList[index]);

                          },
                          child: GridViewCardItem(product: viewModel.productList[index],),
                        );
                      }))
                ],
              ),));
      },

    );
  }
}
