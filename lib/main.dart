import 'package:app_e_commerce_project/Ui/Auth/login/login_screen.dart';
import 'package:app_e_commerce_project/Ui/Auth/register/register_screen.dart';
import 'package:app_e_commerce_project/Ui/Utils/app_theme.dart';
import 'package:app_e_commerce_project/Ui/Utils/shared_preference_utils.dart';
import 'package:app_e_commerce_project/Ui/home/cart/cubit/cart_screen_view_model.dart';
import 'package:app_e_commerce_project/Ui/home/home_screen/home_screen_view.dart';
import 'package:app_e_commerce_project/Ui/home/product_details/product_details_view.dart';
import 'package:app_e_commerce_project/Ui/home/tabs/product_list_tab/cubit/product_tab_view_model.dart';
import 'package:app_e_commerce_project/Ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Ui/Utils/my_bloc_observer.dart';
import 'Ui/home/cart/cart_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  String route;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if(token == null){
    route = LoginScreen.routeName;
  }else{
    route = HomeScreenView.routeName;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ProductTapViewModel()),
        BlocProvider(create: (context)=>CartScreenViewModel()),
      ],
      child: MyApp(route: route,)));
}
class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: route,
          routes: {
            SplashScreen.routeName : (context) => SplashScreen(),
            LoginScreen.routeName : (context) => LoginScreen(),
            RegisterScreen.routeName : (context) => RegisterScreen(),
            HomeScreenView.routeName : (context) =>HomeScreenView(),
            ProductDetailsView.routeName : (context)=>ProductDetailsView(),
            CartScreen.routeName : (context) => CartScreen()
          },
          theme: AppTheme.mainTheme,
        );
    },
    );
  }
}
