import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/Login_Response_Entity.dart';

abstract class LoginStatus {}

class LoginInitialState extends LoginStatus {}
class LoginLoadingState extends LoginStatus {}
class LoginErrorState extends LoginStatus {
  Failures errors ;
  LoginErrorState({required this.errors}) ;
}
class LoginSuccessState extends LoginStatus {
    LoginResponseEntity responseEntity ;
    LoginSuccessState({required this.responseEntity});
}
