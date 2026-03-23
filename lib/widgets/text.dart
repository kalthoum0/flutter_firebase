// import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:second_attempt/core/extensions/context_extension.dart';
import 'package:screentasia/screentasia.dart';



class CustomeText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool? padding;
  final TextStyle? themeStyle;
  final TextDirection? textDirection;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final double? letterSpacing;
  final TextAlign? textAlign;
  
  const CustomeText({
    super.key,
    required this.text,  
    this.color,
    this.size,
    this.padding,
    this.themeStyle,
    this.textDirection,
    this.textDecoration,
    this.textOverflow,
    this.letterSpacing,
    this.textAlign

   });   
  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);
    Widget content = Text(         
          textAlign: textAlign,
          overflow: textOverflow,
          text,
          textDirection: textDirection,
          style: (themeStyle?? theme.textTheme.bodySmall)?.copyWith(
          fontSize:
          size?? 12,
          letterSpacing: letterSpacing,
          // 3.sp,        
          // (context.isMobile?
          // 11.sp.ap(adaptivePercentage:
          //         const AdaptivePercentage(
          //           tablet:80,
          //          desktop:60,
          // )):12),     
          decoration: textDecoration,    
          color:color          
          ));
         
      if(padding==true){
        content = Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child:content);
      } 
      return content;     
  }
}