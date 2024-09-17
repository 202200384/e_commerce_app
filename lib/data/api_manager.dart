import 'dart:convert';

import 'package:app_e_commerce_project/Ui/Utils/shared_preference_utils.dart';
import 'package:app_e_commerce_project/data/model/Errors.dart';
import 'package:app_e_commerce_project/data/model/request/LoginRequest.dart';
import 'package:app_e_commerce_project/data/model/request/RegisterRequest.dart';
import 'package:app_e_commerce_project/data/model/response/CartResponse.dart';
import 'package:app_e_commerce_project/data/model/response/CategoryOrBrandResponse.dart';
import 'package:app_e_commerce_project/data/model/response/GetCartResponse.dart';
import 'package:app_e_commerce_project/data/model/response/LoginResponse.dart';
import 'package:app_e_commerce_project/data/model/response/ProductResponse.dart';
import 'package:app_e_commerce_project/data/model/response/RegisterResponse.dart';
import 'package:app_e_commerce_project/data/model/end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  static  const String  baseUrl = 'ecommerce.routemisr.com';
  static Future<RegisterResponse> register(
      String name,String email,String password,String rePassword,String phone)
  async{
    Uri url = Uri.https(baseUrl,EndPoints.signUp);
    var registerRequest = RegisterRequest(
      name:name ,
      email:email ,
      password:password ,
      rePassword: rePassword,
      phone:phone
    );
    try{
   var response = await http.post(url,body: registerRequest.toJson());
   var bodyString = response.body;
   var json = jsonDecode(bodyString);
   return RegisterResponse.fromJson(json);
    }catch(e){
      throw e ;
    }
   // RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(String email,String password)async{
    Uri url = Uri.https(baseUrl,EndPoints.signIn);
    LoginRequest loginRequest = LoginRequest(
      email:email,
      password:password
    );
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return LoginResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

static Future<CategoryOrBrandResponse> getAllCategories()async{
    try{
      Uri url = Uri.https(baseUrl,EndPoints.getAllCategories);
      var response =await http.get(url);
      return CategoryOrBrandResponse.fromJson(jsonDecode(response.body));
    }catch(e){
        throw e;
    }
}

  static Future<CategoryOrBrandResponse> getAllBrands()async{
    try{
      Uri url = Uri.https(baseUrl,EndPoints.getAllBrands);
      var response =await http.get(url);
      return CategoryOrBrandResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts()async{
    try{
      Uri url = Uri.https(baseUrl,EndPoints.getAllProducts);
      var response =await http.get(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  static Future<Either<Errors,AddCartResponse>> addToCart(String productId)async{
    Uri url = Uri.https(baseUrl,EndPoints.addToCart);

    try {
     var token =  SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url, body: {'productId':productId},
      headers: {'token':token.toString()
      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addCartResponse= AddCartResponse.fromJson(json);
      if(response.statusCode>=200 && response.statusCode<300) {
        return Right(addCartResponse);
      }else{
        return Left(ServerError(errorMsg: addCartResponse.message!));
      }
    }catch(e){
      return Left(NetworkError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Errors,GetCartResponse>> getCart()async{
    Uri url = Uri.https(baseUrl,EndPoints.addToCart);

    try {
      var token =  SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url,
          headers: {'token':token.toString()
          });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse= GetCartResponse.fromJson(json);
      if(response.statusCode>=200 && response.statusCode<300) {
        return Right(getCartResponse);
      }else{
        return Left(ServerError(errorMsg: getCartResponse.message!));
      }
    }catch(e){
      return Left(NetworkError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Errors,GetCartResponse>> deleteItemInCart(String productId)async{
    Uri url = Uri.https(baseUrl,'${EndPoints.addToCart}/$productId');

    try {
      var token =  SharedPreferenceUtils.getData(key: 'token');
      var response = await http.delete(url,
          headers: {'token':token.toString()
          });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemInCartResponse= GetCartResponse.fromJson(json);
      if(response.statusCode>=200 && response.statusCode<300) {
        return Right(deleteItemInCartResponse);
      }else{
        return Left(ServerError(errorMsg: deleteItemInCartResponse.message!));
      }
    }catch(e){
      return Left(NetworkError(errorMsg: e.toString()));
    }
  }

  static Future<Either<Errors,GetCartResponse>> updateCountInCart(String productId,int count)async{
    Uri url = Uri.https(baseUrl,'${EndPoints.addToCart}/$productId');

    try {
      var token =  SharedPreferenceUtils.getData(key: 'token');
      var response = await http.put(url,
          body: {
        'count':'$count'
          },
          headers: {'token':token.toString()
          });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var updateCountInCartResponse= GetCartResponse.fromJson(json);
      if(response.statusCode>=200 && response.statusCode<300) {
        return Right(updateCountInCartResponse);
      }else{
        return Left(ServerError(errorMsg: updateCountInCartResponse.message!));
      }
    }catch(e){
      return Left(NetworkError(errorMsg: e.toString()));
    }
  }

  static Future<ProductResponse> getFavouriteProducts()async{
    try{
      Uri url = Uri.https(baseUrl,EndPoints.getFavouriteProducts);
      var response =await http.post(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  static Future<ProductResponse> getProfile()async{
    try{
      Uri url = Uri.https(baseUrl,EndPoints.getProfile);
      var response =await http.post(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

}