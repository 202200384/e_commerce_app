
import 'package:app_e_commerce_project/Ui/Auth/login/cubit/cubit_login.dart';
import 'package:app_e_commerce_project/Ui/Auth/login/cubit/state_login.dart';
import 'package:app_e_commerce_project/Ui/Utils/dialog_utils.dart';
import 'package:app_e_commerce_project/Ui/Utils/my_colors.dart';
import 'package:app_e_commerce_project/Ui/Utils/shared_preference_utils.dart';
import 'package:app_e_commerce_project/Ui/Utils/text_field_item.dart';
import 'package:app_e_commerce_project/Ui/home/home_screen/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CubitLogin cubit = CubitLogin();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitLogin, StateLogin>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, loadingLabel: 'Waiting...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            posActionName: 'Ok',
            title: 'Error',
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: 'Login Successfully',
            posActionName: 'Ok',
            title: 'Success',
          );
          SharedPreferenceUtils.saveData(key: 'token', value: state.response.token);
          Navigator.of(context).pushReplacementNamed(HomeScreenView.routeName);
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
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 46.h, left: 97.w, right: 96.w),
                child: Image.asset('assets/images/Route.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          children: [
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
                                final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                ).hasMatch(value);
                                if (!emailValid) {
                                  return 'Please enter valid Email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFieldItem(
                              fieldName: 'Password',
                              hintText: 'Enter your password',
                              controller: cubit.passWordController,
                              validator: (value) {
                                if (value == null || value
                                    .trim()
                                    .isEmpty) {
                                  return 'Please enter password';
                                }
                                if (value
                                    .trim()
                                    .length < 6 || value
                                    .trim()
                                    .length > 30) {
                                  return 'Password must be > 6 & < 30';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: cubit.isObscure,
                              suffixIcon: InkWell(
                                child: cubit.isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onTap: () {
                                  setState(() {
                                    cubit.isObscure = !cubit.isObscure;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top:35.h),
                              child: ElevatedButton(
                                onPressed: () {
                                  cubit.login();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.r)),
                                  ),
                                ),
                                child: SizedBox(
                                  height: 64.h,
                                  width: 398.w,
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text('forget password?',
                        style: Theme.of(context)
                      .textTheme.titleMedium!
                      .copyWith(
                          color: AppColors.whiteColor
                        ),
                    textAlign: TextAlign.end,),
                    Padding(
                        padding:EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.whiteColor
                        ),),
                        TextButton(
                            onPressed:(){
                              Navigator.pushNamed(context, 'register_screen');
                            },
                            child: Text('Create Account',style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold
                              ),))
                      ],
                    ),)

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