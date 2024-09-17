import 'package:app_e_commerce_project/Ui/Auth/login/cubit/state_login.dart';
import 'package:app_e_commerce_project/Ui/Auth/register/cubit/state_register.dart';
import 'package:app_e_commerce_project/data/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitLogin extends Cubit<StateLogin> {
  CubitLogin() :super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var passWordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'nehal@pua.com');
  bool isObscure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
            emailController.text,
            passWordController.text,
            );
        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
        } else {
          emit(LoginSuccessState(response: response));

        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}