import 'package:e_commerece/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
typedef MyValidator = String? Function(String?)? ;

class CustomTextFormField extends StatefulWidget {
  Color? filledColor;
  Color borderColor;

  TextStyle? hintStyle;

  String? hintText;

  Widget? label;

  TextStyle? labelStyle;

  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isObscureText;

  bool isPassword;

  TextStyle? textStyle;
  bool readonly;

  TextEditingController? controller;

  TextInputType? keyboardType;

  String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.suffixIcon,
    this.isObscureText = false,
    this.validator,
    this.controller,
    this.textStyle,
    this.label,
    this.prefixIcon,
    this.isPassword = false,
    this.filledColor = Colors.white,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.white,
    this.readonly = false,

  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.only(top: 12,bottom: 20),
      child: TextFormField(
        style: widget.textStyle,
        obscureText: widget.isObscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        readOnly: widget.readonly,
    decoration: InputDecoration(
      filled: true,
    fillColor: widget.filledColor,
    hintText: widget.hintText ,
    hintStyle: widget.hintStyle,
    label: widget.label,
    labelStyle: widget.labelStyle,
    prefixIcon: widget.prefixIcon,
    suffixIcon: widget.isPassword? IconButton(
        onPressed: (){
          widget.isObscureText =!widget.isObscureText;
          setState(() {});
        },
        icon: Icon( widget.isObscureText ?Icons.visibility_off :Icons.visibility))
        :widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.borderColor ,width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.borderColor ,width: 1),
        ),
       errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.redColor),
      ),
       focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.redColor),
      ),

    ),

      ),
    );
  }
}

