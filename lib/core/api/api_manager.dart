import 'package:dio/dio.dart';
import 'package:e_commerece/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {

final dio = Dio() ;
//https://ecommerce.routemisr.com/api/v1/auth/signup
 Future<Response> getDate ({required String endPoint ,Map<String, dynamic> ? queryParameters ,
      Options ? options,Map<String , dynamic>? headers }){
   return dio.get(ApiConstants.baseUrl+endPoint ,
   queryParameters: queryParameters ,options: Options(
           validateStatus: (status) => true ,
           headers: headers
       )) ;
 }
  Future<Response> postDate ({required String endPoint ,Map<String, dynamic> ? queryParameters ,
    Options ? options,Object? body ,Map<String , dynamic>? headers}){
    return dio.post(ApiConstants.baseUrl+endPoint ,
        queryParameters: queryParameters ,data: body,options: Options(
          validateStatus: (status) => true ,
          headers: headers
        )) ;
  }
}