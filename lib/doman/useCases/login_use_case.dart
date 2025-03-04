import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/Login_Response_Entity.dart';
import 'package:e_commerece/doman/repostieries/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  // object => repository
  AuthRepository authRepository ;
  LoginUseCase({required this.authRepository}) ;

 Future<Either<Failures,LoginResponseEntity>> invoke
      (  String email ,String password ,){
   return authRepository.login(email, password) ;
  }
}
