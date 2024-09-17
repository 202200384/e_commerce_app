
import 'package:app_e_commerce_project/Ui/home/tabs/favourite_tab/cubit/favourite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/api_manager.dart';
import '../../../../../data/model/response/ProductResponse.dart';

class FavouriteTabViewModel extends Cubit<FavouriteTabStates> {
  FavouriteTabViewModel() : super(FavouriteTabInitialState());

  List<Product> favouriteProducts = [];

  void getFavourites() async {
    try {
      emit(FavouriteTabLoadingState());
      // Replace with your actual API call to get favourite products
      var response = await ApiManager.getFavouriteProducts();
      if (response.statusMsg == 'fail') {
        emit(FavouriteTabErrorState(errorMsg: response.message!));
      } else {
        favouriteProducts = response.data ?? [];
        emit(FavouriteTabSuccessState(favouriteProducts: favouriteProducts));
      }
    } catch (e) {
      emit(FavouriteTabErrorState(errorMsg: e.toString()));
    }
  }
}