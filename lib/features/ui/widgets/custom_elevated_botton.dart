import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevetedButton extends StatelessWidget {
  String text ;
  Color backgroundColor ;
  TextStyle textStyle ;
  void Function()? onPressed ;


  CustomElevetedButton({
   super.key,
  required this.textStyle,
  required this.backgroundColor,
  required this.text,
    required this.onPressed
  }) ;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return  ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor:backgroundColor ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      child: Center(child: Text(text,style: textStyle,),),
    );

  }
}
