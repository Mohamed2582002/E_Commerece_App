import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/register_response_Entite.dart';
import 'package:e_commerece/doman/repostieries/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase{
  // object => repository
  AuthRepository authRepository ;
  RegisterUseCase({required this.authRepository}) ;

 Future<Either<Failures,RegisterResponseEntity>> invoke
      ( String name , String email ,String password ,String rePassword ,String phone){
   return authRepository.register
     (name, email, password, rePassword, phone) ;
  }
}
