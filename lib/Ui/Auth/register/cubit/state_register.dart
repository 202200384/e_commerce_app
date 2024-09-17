import 'package:app_e_commerce_project/data/model/response/RegisterResponse.dart';

abstract class StateRegister{}
class RegisterInitialState extends StateRegister{}
class RegisterLoadingState extends StateRegister{}
class RegisterErrorState extends StateRegister{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends StateRegister{
  RegisterResponse response;
  RegisterSuccessState({required this.response});
}