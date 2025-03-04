import 'package:e_commerece/core/di/di.dart';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/core/utils/my_bloc_observer.dart';
import 'package:e_commerece/features/ui/auth/login/login_screen.dart';
import 'package:e_commerece/features/ui/auth/register/register_screen.dart';
import 'package:e_commerece/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerece/features/ui/pages/product_details_screen/product_details_screen.dart';
import 'package:e_commerece/features/ui/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: AppRoutes.splashRoute ,
      routes: {
        AppRoutes.homeRoute: (context) => HomeScreen(),
        AppRoutes.registerRoute: (context) => RegisterScreen(),
        AppRoutes.splashRoute: (context) => SplashScreen(),
        AppRoutes.loginRoute:(context) => LoginScreen() ,
        AppRoutes.productDetailsRoute:(context) => ProductDetailsScreen(),
      },

    );
  }
}
