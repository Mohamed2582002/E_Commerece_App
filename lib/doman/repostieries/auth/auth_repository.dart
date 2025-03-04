import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/Login_Response_Entity.dart';
import 'package:e_commerece/doman/entities/register_response_Entite.dart';

abstract class AuthRepository {
  Future<Either<Failures,RegisterResponseEntity>> register(
    String name , String email ,String password ,String rePassword ,String phone,
      );

  Future<Either<Failures,LoginResponseEntity>> login(
      String email ,String password );
}