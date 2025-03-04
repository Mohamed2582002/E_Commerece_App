
import 'dart:async';
import 'package:e_commerece/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenTimer(){
    Timer(const Duration(seconds: 4), () async{
             Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute) ;
            }) ;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreenTimer() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
         children: [
           Image.asset('assets/images/splash_image_bg.png',
             fit: BoxFit.cover,width: double.infinity,height: double.infinity,) ,
           Center(child: Image.asset('assets/images/image_splash-1.png'),),
         ],
     ),
    );
  }
}
