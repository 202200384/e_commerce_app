import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavigationBar({
  required int selectedIndex,
  required Function(int) onTapFunction,
  required BuildContext context,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
      currentIndex: selectedIndex, // استخدام الـ selectedIndex الممرر
      onTap: onTapFunction, // استخدام الـ onTapFunction الممررة
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.whiteColor, // Set unselected icon color to white
      selectedItemColor: AppColors.whiteColor, // Set background color to blue
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
  );
}