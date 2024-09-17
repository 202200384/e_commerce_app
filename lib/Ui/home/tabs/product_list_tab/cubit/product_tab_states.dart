import 'package:app_e_commerce_project/data/model/response/ProductResponse.dart';

import '../../../../../data/model/Errors.dart';
import '../../../../../data/model/response/CartResponse.dart';

abstract class ProductTapStates{}
class ProductTapInitialState extends ProductTapStates{}
class ProductTapLoadingState extends ProductTapStates{}
class ProductTapErrorState extends ProductTapStates{
  String errorMsg;
  ProductTapErrorState({required this.errorMsg});
}
class ProductTapSuccessState extends ProductTapStates{
ProductResponse productResponse ;
ProductTapSuccessState({required this.productResponse});
}

class CartInitialState extends ProductTapStates{}
class AddCartLoadinglState extends ProductTapStates{}
class AddCartErrorState extends ProductTapStates{
  Errors errors;
  AddCartErrorState({required this.errors});
}
class AddCartSuccessState extends ProductTapStates{
  AddCartResponse addCartResponse;
  AddCartSuccessState({required this.addCartResponse});
}