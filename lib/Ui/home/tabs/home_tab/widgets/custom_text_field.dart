
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.h),
        hintText: "What do you search for?"
       ,hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: const Color.fromRGBO(6, 0, 79, 0.6)
      ),
        prefixIcon: IconButton(
            onPressed:(){},
            icon: Icon(
              Icons.search,
              size: 32.sp,
              color: AppColors.primaryColor.withOpacity(0.75),
            ),
        )
      ),
    );
  }
}
