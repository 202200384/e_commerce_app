import 'package:app_e_commerce_project/Ui/home/cart/cubit/cart_screen_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/cart/cubit/cart_states.dart';
import 'package:app_e_commerce_project/Ui/home/cart/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/my_colors.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart_screen';
  @override
  Widget build(BuildContext context) {
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
              fontWeight: FontWeight.bold
          ),
          actions: [
            IconButton(
              onPressed:(){},
              padding: EdgeInsets.zero,
              icon:Icon(Icons.search),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                icon:Icon(Icons.shopping_cart_checkout_outlined))
          ],
        ),
      body: BlocBuilder<CartScreenViewModel,CartStates>(
          bloc: CartScreenViewModel.get(context)..getCart(),
          builder: (context,state){
          return  state is GetCartSuccessState ?
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child:ListView.builder(
                        itemBuilder: (context,index){
                          return CartItem(productCart: state.getCartResponse.data!.products![index],);
                        },
                    itemCount: state.getCartResponse.data!.products!.length,
                    )),
                Padding(padding: EdgeInsets.only(bottom: 98.h,left: 16.w,right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 12.h),
                        child: Text('Total Price',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.greyColor
                        ),
                        ),),
                        Text('EGP ${state.getCartResponse.data!.totalCartPrice}',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor
                          ),)
                      ],
                    ),
                    InkWell(

                    )
                  ],
                ),
                )
              ],
            ):
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
          },
         ),
    );
  }
}
