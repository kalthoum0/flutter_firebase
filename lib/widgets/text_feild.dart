import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_attempt/core/extensions/context_extension.dart';
import 'package:screentasia/screentasia.dart';

class Customtextfeild extends StatelessWidget {  

  final TextEditingController?  controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? color;
  final double? height;
  final bool? enabled;
  final void Function()? ontap;

 


  const Customtextfeild({
    super.key,
    this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.obscureText = false,
    this.inputFormatters,
    this.prefixIcon,
    this.textDirection,
    this.validator,    
    this.hintText,
    this.color,
    this.height,
    this.enabled,
    this.ontap
 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(      
      onTap:ontap ,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      style: Theme.of(context).textTheme.titleSmall ,      
      textDirection: textDirection,
      decoration: InputDecoration( 
      hintText:hintText ,
      hintStyle: TextStyle(
        color: Colors.grey, 
        fontSize:(context.isMobile?
          11.sp.ap(adaptivePercentage:
                  const AdaptivePercentage(
                    tablet:80,
                   desktop:60,
          )):12),),
      errorStyle: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize:context.isMobile?
          11.sp.ap(adaptivePercentage:
                  const AdaptivePercentage(
                    tablet:80,
                   desktop:60,
          )):12,

        height: height?? 1.2, ),         
        prefixIcon: prefixIcon,          
        fillColor:color?? Color.fromARGB(255, 245, 244, 244),
        filled: true,        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none//Hides the border 
        ),                                        
      ),
    );
  }
}

