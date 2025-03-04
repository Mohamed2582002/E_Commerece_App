import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/api/api_manager.dart';
import 'package:e_commerece/core/api/endPoint.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/date/model/CategoryResponseDm.dart';
import 'package:e_commerece/date/model/ProductResponseDm.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart';
import 'package:e_commerece/doman/repostieries/date_sources/remote_date_sources/home_remote_date_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDateSource)
class HomeRemoteDateSourceImpl implements HomeRemoteDateSource {
  ApiManager apiManager ;
  HomeRemoteDateSourceImpl({required this.apiManager}) ;

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategory()async {
    try {
      final List<ConnectivityResult> connectivityResult = await(Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        // internet
        var response = await apiManager.getDate(endPoint: EndPoints.getAllCategory, );


        var categoryResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'NO Internet collection'));
      }
    }
    catch (e) {
      return Left(Failures (errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllBrands() async{
    try {
      final List<ConnectivityResult> connectivityResult = await(Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        // internet
        var response = await apiManager.getDate(endPoint: EndPoints.getAllBrands, );


        var brandResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMessage: brandResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'NO Internet collection'));
      }
    }
    catch (e) {
      return Left(Failures (errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts()async {
    try {
      final List<ConnectivityResult> connectivityResult = await(Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        // internet
        var response = await apiManager.getDate(endPoint: EndPoints.getAllProducts, );


         var productResponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: 'NO Internet collection'));
      }
    }
    catch (e) {
      return Left(Failures (errorMessage: e.toString()));
    }
  }

}