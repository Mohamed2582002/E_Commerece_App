  import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart';
import 'package:e_commerece/doman/repostieries/date_sources/remote_date_sources/home_remote_date_source.dart';
import 'package:e_commerece/doman/repostieries/home/home_repostieries.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepostiery)
class HomeRepositoryImpl implements HomeRepostiery{
  HomeRemoteDateSource homeRemoteDateSource ;
  HomeRepositoryImpl({required this.homeRemoteDateSource}) ;

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategory() async{
    var either =await homeRemoteDateSource.getAllCategory() ;
    return either.fold((error) => left(error), (response) => right(response)) ;
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands()async {
    var either =await homeRemoteDateSource.getAllBrands() ;
    return either.fold((error) => left(error), (response) => right(response)) ;
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async{
    var either =await homeRemoteDateSource.getAllProducts() ;
    return either.fold((error) => left(error), (response) => right(response)) ;
  }

}