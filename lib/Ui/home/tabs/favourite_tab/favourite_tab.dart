import 'package:app_e_commerce_project/Ui/home/tabs/favourite_tab/cubit/favourite_states.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/favourite_tab/cubit/favourite_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../product_list_tab/widgets/grid_view_card_item.dart';

class FavouriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteTabViewModel()..getFavourites(),
      child: BlocBuilder<FavouriteTabViewModel, FavouriteTabStates>(
        builder: (context, state) {
          if (state is FavouriteTabLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FavouriteTabErrorState) {
            return Center(child: Text('Error: ${state.errorMsg}'));
          } else if (state is FavouriteTabSuccessState) {
            return GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.favouriteProducts.length,
              itemBuilder: (context, index) {
                return GridViewCardItem(product: state.favouriteProducts[index]);
              },
            );
          } else {
            return Center(child: Text('No favourites found.'));
          }
        },
      ),
    );
  }
}