import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/Login_Response_Entity.dart';
import 'package:e_commerece/doman/entities/register_response_Entite.dart';
import 'package:e_commerece/doman/repostieries/auth/auth_repository.dart';
import 'package:e_commerece/doman/repostieries/date_sources/remote_date_sources/auth_remote_date_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDateSource authRemoteDateSource ;
  AuthRepositoryImpl({required this.authRemoteDateSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register
      (String name, String email, String password, String rePassword, String phone) async{
   var either = await authRemoteDateSource.register(name, email, password,
       rePassword, phone) ;

   return either.fold((error) => Left(error),  (response) => Right(response)) ;
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password)async {
    var either = await authRemoteDateSource.login( email, password ) ;

    return either.fold((error) => Left(error),  (response) => Right(response)) ;
  }
}