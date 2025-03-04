import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerece/doman/repostieries/home/home_repostieries.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase{
  HomeRepostiery homeRepostiery ;
  GetAllCategoriesUseCase({required this.homeRepostiery});

  Future<Either<Failures,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepostiery.getAllCategory() ;
  }
}