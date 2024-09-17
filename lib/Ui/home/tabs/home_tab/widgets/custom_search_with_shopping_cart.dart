import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField()),
      ],
    );
  }
}
