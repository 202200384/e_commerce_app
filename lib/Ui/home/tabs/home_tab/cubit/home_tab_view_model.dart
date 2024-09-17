import 'package:app_e_commerce_project/Ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:app_e_commerce_project/data/api_manager.dart';
import 'package:app_e_commerce_project/data/model/response/CategoryOrBrandResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  List<CategoryOrBrand> categoriesList=[];
  List<CategoryOrBrand> brandsList=[];

  HomeTabViewModel():super(HomeTabInitialState());

  void getAllCategories()async{
    try{
      emit(HomeCategoryLoadingState());
      var response = await ApiManager.getAllCategories();
      if(response.statusMsg=='fail'){
        emit(HomeBrandsErrorState(errorMessage: response.message!));
      }else{
        categoriesList =response.data??[];
        emit(HomeBrandsSuccessState(response: response)) ;
      }
    }catch(e){
      emit(HomeBrandsErrorState(errorMessage: e.toString()));
    }
  }
  void getAllBrands()async{
    try{
      emit(HomeBrandsLoadingState());
      var response = await ApiManager.getAllBrands();
      if(response.statusMsg=='fail'){
        emit(HomeBrandsErrorState(errorMessage: response.message!));
      }else{
        brandsList =response.data??[];
        emit(HomeBrandsSuccessState(response: response)) ;
      }
    }catch(e){
      emit(HomeBrandsErrorState(errorMessage: e.toString()));
    }
  }
}