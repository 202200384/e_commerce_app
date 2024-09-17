import 'package:app_e_commerce_project/Ui/home/tabs/product_list_tab/cubit/product_tab_states.dart';
import 'package:app_e_commerce_project/data/api_manager.dart';
import 'package:app_e_commerce_project/data/model/response/ProductResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTapViewModel extends Cubit<ProductTapStates> {
  ProductTapViewModel() : super(ProductTapInitialState());

  List<Product> productList = [];
  int numOfCartItems = 0;

  static ProductTapViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    try {
      emit(ProductTapLoadingState());
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail') {
        emit(ProductTapErrorState(errorMsg: response.message!));
      } else {
        productList = response.data ?? [];
        emit(ProductTapSuccessState(productResponse: response));
      }
    } catch (e) {
      emit(ProductTapErrorState(errorMsg: e.toString()));
    }
  }

  void addToCart(String productId) async {
    emit(AddCartLoadinglState());
    var either = await ApiManager.addToCart(productId);
    either.fold(
          (l) => emit(AddCartErrorState(errors: l)),
          (response) {
        numOfCartItems = response.numOfCartItems!.toInt();
        emit(AddCartSuccessState(addCartResponse: response));
      },
    );
  }
}