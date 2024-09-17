import 'package:app_e_commerce_project/Ui/Auth/register/cubit/state_register.dart';
import 'package:app_e_commerce_project/data/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitRegister extends Cubit<StateRegister> {
  CubitRegister() :super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'Nehal');
  var passWordController = TextEditingController(text: '123456');
  var conformationPassWordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'nehal@pua.com');
  var phoneController = TextEditingController(text: '01212121212');
  bool isObscure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState());
        var response = await ApiManager.register(nameController.text,
            emailController.text,
            passWordController.text, conformationPassWordController.text,
            phoneController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMessage: response.message!));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}