import 'package:e_commerece/core/di/di.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/dialog_utils.dart';
import 'package:e_commerece/core/utils/validators.dart';
import 'package:e_commerece/features/ui/auth/login/cubit/login-view_model.dart';
import 'package:e_commerece/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerece/features/ui/widgets/custom_elevated_botton.dart';
import 'package:e_commerece/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginViewModel viewModel =getIt<LoginViewModel>() ;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,LoginStatus>(
        bloc: viewModel,
        listener: (context,state) {
      if(state is LoginLoadingState){
        DialogUtils.showLoading(context: context, message: 'Loading......') ;
      } else if (state is LoginErrorState){
        DialogUtils.hideLoading(context) ;
        DialogUtils.showMessage(context: context, message: state.errors.errorMessage,
            posActionName: 'Ok',title:'Error' ) ;
      } else if (state is LoginSuccessState){
        DialogUtils.hideLoading(context) ;
        DialogUtils.showMessage(context: context, message:'Login successFully.',
            posActionName: 'Ok',title:'Error' ,posAction: (){
          Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute) ;
            }) ;
      }
    },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
          Padding(
          padding:  EdgeInsets.only(top: 91,bottom: 10,left: 97,right: 97),
          child: Image.asset('assets/images/image_route.png'),
                ),
                Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                Padding(padding: EdgeInsets.only(top: 40),
                child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Welcome Back To Route',style: AppStyles.semi24White,),
              Text('Please sign in with your mail',style: AppStyles.light16White,),
                
              Padding(padding: EdgeInsets.only(top: 25)) ,
              Text('User Email',style: AppStyles.medium18white,),
              Padding(padding: EdgeInsets.only(top: 10)) ,
              CustomTextFormField(
                isPassword: false,
                keyboardType: TextInputType.name,
                isObscureText: false,
                hintText: 'enter your email',
                hintStyle: AppStyles.light18Hint,
                filledColor: AppColors.whiteColor,
                controller: viewModel.mailController,
                validator: AppValidators.validateEmail,
              ),
              Padding(padding: EdgeInsets.only(top: 10)) ,
              Text('Password',style: AppStyles.medium18white,),
              Padding(padding: EdgeInsets.only(top: 10)) ,
              CustomTextFormField(
                isPassword: true,
                keyboardType: TextInputType.emailAddress,
                isObscureText: true,
                hintText: 'enter your password',
                hintStyle: AppStyles.light18Hint,
                filledColor: AppColors.whiteColor,
                controller: viewModel.passwordController,
                validator: AppValidators.validatePassword,
                suffixIcon: IconButton(onPressed: (){},
                    icon: Icon(Icons.visibility_off)),
              ),
                
              Padding(padding: EdgeInsets.only(top: 1)) ,
              Text('Forget Password',style: AppStyles.medium18white,textAlign: TextAlign.right,),
                
              Padding(padding: EdgeInsets.only(top: 35)) ,
              CustomElevetedButton(
                  textStyle: AppStyles.semi20Primary,
                  backgroundColor: AppColors.whiteColor,
                  text: "Login",
                  onPressed: (){
                   viewModel.login() ;

                  }
              ) ,
                
              Padding(padding: EdgeInsets.only(top: 15,bottom: 30),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.registerRoute);
                  },
                  child: Row(
                    children: [
                      Expanded(child: Text(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        'Don’t have an account? Create Account',
                        style: AppStyles.medium18white,
                        maxLines: 1,
                      )),
                    ],
                  ),
                ),
              ),
                
            ],
          ),
                ) ,
                ),
          ],
                ) ,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
