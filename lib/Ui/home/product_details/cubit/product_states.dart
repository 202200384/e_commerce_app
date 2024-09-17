import 'package:app_e_commerce_project/data/model/response/ProductResponse.dart';

abstract class ProductDetailsStates{}
class ProductDetailsInitialState extends ProductDetailsStates{}
class ProductDetailsLoadingState extends ProductDetailsStates{}
class ProductDetailsSuccessState extends ProductDetailsStates{
 ProductResponse productResponse;
 ProductDetailsSuccessState({required this.productResponse});
}
class ProductDetailsErrorState extends ProductDetailsStates{
  String errorMsg;
  ProductDetailsErrorState({required this.errorMsg});
}