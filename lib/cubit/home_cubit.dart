import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:task_for_route/cubit/home_state.dart';
import '../model/products.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(InitialHome());
  Future<Products>getProduct()async{
    emit(LoadingHome());
    try{
      Uri url= Uri.parse("https://dummyjson.com/products");
      Response response =await get(url);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Products products= Products.fromJson(jsonData);
      print("*******");
      print(jsonData);
      if(response.statusCode>=200&&response.statusCode<300){
        emit(SuccessHome());
        return products;
      } else {
        emit(FailureHome(errMessage: "some thing went wrong please try again later"));
        throw Exception("Something went wrong: ${response.statusCode}");
      }
    }catch(e){
      emit(FailureHome(errMessage: e.toString()));
      throw Exception("failed");
    }
  }
}