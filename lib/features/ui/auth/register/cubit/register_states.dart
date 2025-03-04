import 'package:e_commerece/core/errors/faliurs.dart';
import 'package:e_commerece/doman/entities/register_response_Entite.dart';

abstract class RegisterStatus {}

class RegisterInitialState extends RegisterStatus {}
class RegisterLoadingState extends RegisterStatus {}
class RegisterErrorState extends RegisterStatus {
  Failures errors ;
  RegisterErrorState({required this.errors}) ;
}
class RegisterSuccessState extends RegisterStatus {
    RegisterResponseEntity responseEntity ;
    RegisterSuccessState({required this.responseEntity});
}
