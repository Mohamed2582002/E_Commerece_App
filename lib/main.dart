import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:e_commerece/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: AppRoutes.registerRoute ,
      routes: {
      AppRoutes.registerRoute: (context) => RegisterScreen(),
      },

    );
  }
}
