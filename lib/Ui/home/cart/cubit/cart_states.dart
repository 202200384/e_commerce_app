import 'package:app_e_commerce_project/data/model/response/CartResponse.dart';
import 'package:app_e_commerce_project/data/model/response/GetCartResponse.dart';

import '../../../../data/model/Errors.dart';

abstract class CartStates{}
class CartInitialState extends CartStates{}


class GetCartLoadingState extends CartStates{}
class GetCartErrorState extends CartStates{
  Errors errors;
  GetCartErrorState({required this.errors});
}
class GetCartSuccessState extends CartStates{
  GetCartResponse getCartResponse;
  GetCartSuccessState({required this.getCartResponse});
}

class DeleteCartLoadingState extends CartStates{}
class DeleteCartErrorState extends CartStates{
  Errors errors;
  DeleteCartErrorState({required this.errors});
}
class DeleteCartSuccessState extends CartStates{
  GetCartResponse getCartResponse;
  DeleteCartSuccessState({required this.getCartResponse});
}

class UpdateCartLoadingState extends CartStates{}
class UpdateCartErrorState extends CartStates{
  Errors errors;
  UpdateCartErrorState({required this.errors});
}
class UpdateCartSuccessState extends CartStates{
  GetCartResponse getCartResponse;
  UpdateCartSuccessState({required this.getCartResponse});
}
