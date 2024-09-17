import 'package:app_e_commerce_project/Ui/home/product_details/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/api_manager.dart';

class ProductDetailsViewModel extends Cubit<ProductDetailsStates>{
 ProductDetailsViewModel():super(ProductDetailsInitialState());

 //todo: hold data  -  handle logic.

 void getAllProducts()async{
   try {
     emit(ProductDetailsLoadingState());
     var response = await ApiManager.getAllProducts();
     if (response.statusMsg == "fail") {
       emit(ProductDetailsErrorState(errorMsg: response.message!));
     } else {

       emit(ProductDetailsSuccessState(productResponse: response));
     }
   } catch (e) {
     emit(ProductDetailsErrorState(errorMsg: e.toString()));
   }
 }

}