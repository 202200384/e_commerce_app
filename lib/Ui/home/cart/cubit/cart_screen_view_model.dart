import 'package:app_e_commerce_project/Ui/home/cart/cubit/cart_states.dart';
import 'package:app_e_commerce_project/data/api_manager.dart';
import 'package:app_e_commerce_project/data/model/response/GetCartResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenViewModel extends Cubit<CartStates>{
  CartScreenViewModel():super(CartInitialState());

List<GetProductCart> productsList = [];

static CartScreenViewModel get(context) =>BlocProvider.of(context);

void getCart()async{
  emit(GetCartLoadingState());
 var either=await ApiManager.getCart();
 either.fold((l)=>emit(GetCartErrorState(errors:l)),
     (response){
   productsList = response.data!.products??[];
   emit(GetCartSuccessState(getCartResponse: response));
     });
}

  void DeleteItemInCart(String productId)async{
    emit(DeleteCartLoadingState());
    var either=await ApiManager.deleteItemInCart(productId);
    either.fold((l)=>emit(DeleteCartErrorState(errors:l)),
            (response){
         // productsList = response.data!.products??[];
          emit(GetCartSuccessState(getCartResponse: response));
        });
  }

  void updateCountInCart(String productId,int count)async{
    emit(UpdateCartLoadingState());
    var either=await ApiManager.updateCountInCart(productId, count);
    either.fold((l)=>emit(UpdateCartErrorState(errors:l)),
            (response){
          // productsList = response.data!.products??[];
          emit(GetCartSuccessState(getCartResponse: response));
        });
  }
}