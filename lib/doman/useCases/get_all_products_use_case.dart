import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart';
import 'package:e_commerece/doman/repostieries/home/home_repostieries.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase{
  HomeRepostiery homeRepostiery ;
  GetAllProductsUseCase({required this.homeRepostiery});

  Future<Either<Failures,ProductResponseEntity>> invoke(){
    return homeRepostiery.getAllProducts() ;

  }
}