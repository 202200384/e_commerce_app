import 'package:app_e_commerce_project/Ui/home/home_screen/cubit/home_screen_states.dart';
import 'package:app_e_commerce_project/Ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home';
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectIndex, // تمرير الـ selectedIndex
            onTapFunction: (index) {
              viewModel.changeSelectedIndex(index); // تمرير الدالة لتغيير الـ index
            },
          ),
          body: viewModel.tabs[viewModel.selectIndex],
        );
      },
    );
  }
}