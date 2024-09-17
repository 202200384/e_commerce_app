
import 'package:app_e_commerce_project/Ui/Auth/register/cubit/cubit_register.dart';
import 'package:app_e_commerce_project/Ui/Auth/register/cubit/state_register.dart';
import 'package:app_e_commerce_project/Ui/Utils/dialog_utils.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_assets.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:app_e_commerce_project/Ui/Utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 CubitRegister cubit = CubitRegister();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitRegister,StateRegister>(
      bloc: cubit,
      listener: (context,state){
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context: context, loadingLabel:'loading...');
        }else if(state is RegisterErrorState){
    DialogUtils.hideLoading(context);
    DialogUtils.showMessage(context: context, content: state.errorMessage,
    posActionName: 'Ok',title: 'Error');
        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, content: 'Register Successfully',
          posActionName: 'Ok',title: 'Success');
        }
      },
      child: Scaffold(
        body: Container(
          color: Theme
              .of(context)
              .primaryColor,
          height: double.infinity,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(
                  top: 91.h, bottom: 46.h, left: 97.w, right: 96.w
              ),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'Full Name',
                                hintText: 'Enter your Name',
                                controller: cubit.nameController,
                                validator: (value) {
                                  if (value == null || value
                                      .trim()
                                      .isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },),
                              TextFieldItem(
                                fieldName: 'Mobile Phone',
                                hintText: 'Enter your Mobile number',
                                controller: cubit.phoneController,
                                validator: (value) {
                                  if (value == null || value
                                      .trim()
                                      .isEmpty) {
                                    return 'Please enter your mobile number';
                                  }
                                  return null;
                                },),
                              TextFieldItem(
                                fieldName: 'E-mail Address',
                                hintText: 'Enter your email',
                                controller: cubit.emailController,
                                validator: (value) {
                                  if (value == null || value
                                      .trim()
                                      .isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  final bool emailValid =
                                  RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'please enter valid Email';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ), TextFieldItem(fieldName: 'Password',
                                hintText: 'Enter your password',
                                controller: cubit.passWordController,
                                validator: (value) {
                                  if (value == null || value
                                      .trim()
                                      .isEmpty) {
                                    return 'please enter password';
                                  }
                                  if (value.trim().length < 6||
                                  value.trim().length>30) {
                                    return 'password must be > 6 & <30';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: cubit.isObscure,
                                suffixIcon:InkWell(
                                  child: cubit.isObscure?Icon(Icons.visibility_off):
                                  Icon(Icons.visibility),
                                  onTap: (){
                                    if(cubit.isObscure){
                                      cubit.isObscure = false;
                                    }else{
                                      cubit.isObscure = true;
                                    }
                                    setState(() {

                                    });
                                  },
                                )
                              ),
                              TextFieldItem(fieldName: 'Confirm Password',
                                hintText: 'enter your confirmPassword',
                                controller: cubit.conformationPassWordController,
                                validator: (value) {
                                  if (value == null || value
                                      .trim()
                                      .isEmpty) {
                                    return 'please enter confirm password';
                                  }
                                  if (value!=cubit.passWordController.text) {
                                    return 'password does not match';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:cubit.isObscure,
                                suffixIcon: InkWell(
                                  child: cubit.isObscure? Icon(Icons.visibility_off):
                                  Icon(Icons.visibility),
                                  onTap: (){
                                    if (cubit.isObscure){
                                      cubit.isObscure = false;
                                    }else{
                                      cubit.isObscure = true;
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(onPressed: () {
                                 cubit.register();
                                },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.whiteColor,
                                    shape: RoundedRectangleBorder(borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))
                                  ),
                                  child: SizedBox(
                                    height: 64.h,
                                    width: 398.w,
                                    child: Center(
                                      child: Text('Sign Up',
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 20.sp
                                      ),),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
