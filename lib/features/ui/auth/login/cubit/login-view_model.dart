
import 'package:e_commerece/doman/useCases/login_use_case.dart';
import 'package:e_commerece/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStatus> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  
  TextEditingController mailController = TextEditingController(text: "ahmedmutti@route.com");
  TextEditingController passwordController = TextEditingController(text: "Ahmed@123");
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
         
          mailController.text,
          passwordController.text,
         
      );

      either.fold(
              (error) {
            emit(LoginErrorState(errors: error));
          },
              (response) {
            emit(LoginSuccessState(responseEntity: response));
          }
      );
    }
  }
}