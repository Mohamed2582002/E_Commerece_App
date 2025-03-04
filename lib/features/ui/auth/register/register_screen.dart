import 'package:e_commerece/core/di/di.dart';
import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:e_commerece/core/utils/dialog_utils.dart';
import 'package:e_commerece/core/utils/validators.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register-view_model.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerece/features/ui/widgets/custom_elevated_botton.dart';
import 'package:e_commerece/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget{
  RegisterScreen({super.key});
  
  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}
class _RegisterScreen extends State<RegisterScreen> {
 RegisterViewModel viewModel = getIt<RegisterViewModel>();
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,RegisterStatus>(
      bloc: viewModel,
      listener: (context,state) {
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context: context, message: 'Loading......') ;
        } else if (state is RegisterErrorState){
          DialogUtils.hideLoading(context) ;
          DialogUtils.showMessage(context: context, message: state.errors.errorMessage,
              posActionName: 'Ok',title:'Error' ) ;
        } else if (state is RegisterSuccessState){
          DialogUtils.hideLoading(context) ;
          DialogUtils.showMessage(context: context, message:'Register successFully.',
              posActionName: 'Ok',title:'Error' ) ;
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
                            Text('Full Name',style: AppStyles.medium18white,),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.name,
                              isObscureText: false,
                              hintText: 'enter your full name',
                              hintStyle: AppStyles.light18Hint,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.fullNameController,
                              validator: AppValidators.validateFullName,
                            ),

                            Text('Mobile Number',style: AppStyles.medium18white,),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.phone,
                              isObscureText: false,
                              hintText: 'enter your mobil number',
                              hintStyle: AppStyles.light18Hint,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.phoneController,
                              validator: AppValidators.validatePhoneNumber,
                            ),

                            Text('E-mail address',style: AppStyles.medium18white,),
                            CustomTextFormField(
                              isPassword: false,
                              keyboardType: TextInputType.emailAddress,
                              isObscureText: false,
                              hintText: 'enter your email address',
                              hintStyle: AppStyles.light18Hint,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.mailController,
                              validator: AppValidators.validateEmail,
                            ),

                            Text('Password',style: AppStyles.medium18white,),
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

                            Text('Re_Password',style: AppStyles.medium18white,),
                            CustomTextFormField(
                              isPassword: true,
                              keyboardType: TextInputType.emailAddress,
                              isObscureText: true,
                              hintText: 'enter your re-password',
                              hintStyle: AppStyles.light18Hint,
                              filledColor: AppColors.whiteColor,
                              controller: viewModel.rePasswordController,
                              validator: AppValidators.validatePassword,
                              suffixIcon: IconButton(onPressed: (){},
                                  icon: Icon(Icons.visibility_off)),
                            ),

                            Padding(padding: EdgeInsets.only(top: 15),
                            child: CustomElevetedButton(
                                textStyle: AppStyles.semi20Primary,
                                backgroundColor: AppColors.whiteColor,
                                text: "Sign up",
                                onPressed: (){
                                  viewModel.register();
                                }
                            ) ,
                            ),
                            Padding(padding: EdgeInsets.only(top: 15,bottom: 30),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.loginRoute);
                              },
                              child: Row(
                                children: [
                                  Expanded(child: Text(
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    'Already have an Account? login',
                                    style: AppStyles.medium18white,
                                    maxLines: 1,
                                  )),
                                ],
                              ),
                            ),
                            ),
                          ],
                        )),
                    ),
                  ],
                ),
              ),
             ],
          ),
        ),
      ),
    );
  }
}