import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerece/doman/entities/ProductResponseEntitiy.dart' show ProductResponseEntity;

abstract class HomeRemoteDateSource {

  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategory();

  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
  
}