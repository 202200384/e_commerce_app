
import 'package:app_e_commerce_project/Ui/home/home_screen/cubit/home_screen_states.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/favourite_tab/favourite_tab.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/home_tab.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeInitialState());
  int selectIndex = 0;

  // Define the list of tabs here
  final List<Widget> tabs = [
    HomeTab(),
    FavouriteTab(),
    ProductListTab(),
    ProfileTab()
  ];
  void changeSelectedIndex(int newIndex) {
    emit(HomeInitialState());
    selectIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}