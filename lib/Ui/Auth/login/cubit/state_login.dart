import 'package:app_e_commerce_project/data/model/response/LoginResponse.dart';


abstract class StateLogin{}
class LoginInitialState extends StateLogin{}
class LoginLoadingState extends StateLogin{}
class LoginErrorState extends StateLogin{
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends StateLogin{
  LoginResponse response;
  LoginSuccessState({required this.response});
}