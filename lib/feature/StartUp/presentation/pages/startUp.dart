import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:screentasia/screentasia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_attempt/core/extensions/router/router.gr.dart';
import 'package:second_attempt/core/localization/presentation/bloc/language_bloc.dart';
import 'package:second_attempt/l10n/app_localizations.dart';
import 'package:second_attempt/widgets/button.dart';
import 'package:second_attempt/widgets/text.dart';
@RoutePage()

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
                onPressed: () {
                  final currentState = context.read<LanguageBloc>().state;
                  final newLocale = currentState.locale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en');
                  context.read<LanguageBloc>().add(
                    ChangeLanguageEvent(newLocale),
                  );
                },
                icon: Icon(
                  Icons.language,
                  size: 2.wp,
                  color: theme.colorScheme.secondary,
                ),
              ),
        ],
      ),
      body: Center(        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 20.hp,),
            CustomBtn(
              color: theme.colorScheme.primary,
              text:  CustomeText(
                text: l10n.signUpButton,
                themeStyle: theme.textTheme.titleMedium,
                color: Colors.white),          
              ontap: (){context.pushRoute(SignupPageRoute());}),
            SizedBox(height: 1.wp,),
            CustomBtn(
              color: theme.colorScheme.secondary,
              text:  CustomeText(
                text: l10n.loginButton,
                themeStyle: theme.textTheme.titleMedium,
                color: Colors.white,),          
              ontap: (){context.pushRoute(LoginPageRoute());})
          ],),
        ),
      )
    );
  }
}