import 'package:e_commerece/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading ({
    required BuildContext context ,required String message}) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.all(8.0) ,
                child: Text(message,style: AppStyles.medium18Header,),
              ),
            ],
          ),
        );
        });
  }
  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage ({required BuildContext context ,
    required String message ,
    String? title ,
    String? posActionName ,
    Function? posAction ,
    String? nagActionName ,
    Function? nagAction  }) {
     List<Widget> actions = [];
     if(posActionName != null ){
       actions.add(TextButton(
           onPressed: (){
             Navigator.pop(context);
             posAction?.call() ;
           },
           child: Text(posActionName ,style: AppStyles.medium18Header,))
       );
     }
     if(nagActionName != null){
       actions.add(TextButton(
           onPressed: (){
             Navigator.pop(context);
             nagAction?.call();
           },
           child: Text(nagActionName ,style: AppStyles.medium18Header,))) ;
     }
     showDialog(
         context: context,
         builder: (context){
           return AlertDialog(
             content: Text(message,style: AppStyles.medium18Header,),
             title: Text(title ?? '',style: AppStyles.medium18Header,),
             actions: actions,
           );
         }) ;
  }
  }
