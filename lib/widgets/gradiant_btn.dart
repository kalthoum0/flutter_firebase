import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';
import 'package:second_attempt/widgets/text.dart';

class GradientButton extends StatelessWidget {  
  final VoidCallback ontap;
  final Color? color;
  final Widget text;

  const GradientButton({
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary, 
            theme.colorScheme.secondary.withOpacity(0.7)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: text),
    ),
  );    
  }
}