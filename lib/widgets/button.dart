import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';
import 'package:second_attempt/widgets/text.dart';

class CustomBtn extends StatelessWidget {  
  final VoidCallback ontap;
  final Color? color;
  final Widget text;

  const CustomBtn({
    super.key,   
    required this.ontap,
    required this.text,
    this.color    
    });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
    onTap: ontap,
    borderRadius: BorderRadius.circular(16), 
    child: Container(
      width: double.infinity,
      height: 10.hp,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
       color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: text),
    ),
  );    
  }
}