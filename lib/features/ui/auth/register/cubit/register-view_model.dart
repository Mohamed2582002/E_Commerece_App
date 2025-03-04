
import 'package:e_commerece/doman/useCases/register_use_case.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStatus> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  TextEditingController fullNameController = TextEditingController(text: "Mohamed Abozied");
  TextEditingController phoneController = TextEditingController(text:"01017008701" );
  TextEditingController mailController = TextEditingController(text: "Mohamed2006@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "mohamed765");
  TextEditingController rePasswordController = TextEditingController(text: "mohamed765");
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          fullNameController.text,
          mailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text
      );

      either.fold(
              (error) {
            emit(RegisterErrorState(errors: error));
          },
              (response) {
            emit(RegisterSuccessState(responseEntity: response));
          }
      );
    }
  }
}