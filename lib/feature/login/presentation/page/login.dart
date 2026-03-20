import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';
import 'package:second_attempt/widgets/text_feild.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
           SizedBox(height: 5.hp,),
          Customtextfeild(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next
          ),
          SizedBox(height: 5.hp,),
          Customtextfeild(
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next
          )
        ],
      ),
    );
  }
}