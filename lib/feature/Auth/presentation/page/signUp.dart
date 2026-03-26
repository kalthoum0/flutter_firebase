import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';
import 'package:second_attempt/core/extensions/router/router.gr.dart';
import 'package:second_attempt/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:second_attempt/core/localization/presentation/bloc/language_bloc.dart';
import 'package:second_attempt/l10n/app_localizations.dart';
import 'package:second_attempt/widgets/gradiant_btn.dart';
import 'package:second_attempt/widgets/text.dart';
import 'package:second_attempt/widgets/text_feild.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final TextEditingController nameCntroller = TextEditingController();
    final ValueNotifier<bool> _obscureNotifier = ValueNotifier<bool>(true);
    final ValueNotifier<bool> _obscureConfirmNotif = ValueNotifier<bool>(true);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSuccess) {
        // THE MOVE: Only happens if login is verified
        context.router.replaceAll([MyHomePageRoute(title: 'Welcome ${state.user.displayName}')]);
      } else if (state is AuthFailure) {
        // Show the error message if login fails (e.g., "Wrong password")
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary.withOpacity(0.4),
              theme.colorScheme.background,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: context.back,
              icon: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.secondaryFixed,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
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
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.all(1.wp),
            child: Center(
              child: Container(
                height: 70.hp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.wp),
                  color: theme.colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        112,
                        112,
                        112,
                      ).withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.wp),
                  child: Column(
                    children: [
                      SizedBox(height: 1.hp),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              theme.colorScheme.primary,
                              theme.colorScheme.secondary.withOpacity(0.7),
                            ], // Your gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: CustomeText(
                          size: 14,
                          themeStyle: theme.textTheme.titleMedium,
                          text: l10n.signUpTitle,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 3.hp),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CustomeText(
                              size: 14,
                              themeStyle: theme.textTheme.titleMedium,
                              text: l10n.emailLabel,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.hp),
                      Customtextfeild(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 2.hp),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CustomeText(
                              size: 14,
                              themeStyle: theme.textTheme.titleMedium,
                              text: l10n.userName,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.hp),
                      Customtextfeild(
                        controller: nameCntroller,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 5.hp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CustomeText(
                              size: 14,
                              themeStyle: theme.textTheme.titleMedium,
                              text: l10n.passwordLabel,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.hp),
                      ValueListenableBuilder(
                        valueListenable: _obscureNotifier,
                        builder: (context, value, child) {
                          return Customtextfeild(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            obscureText: value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              onPressed: () {
                                _obscureNotifier.value =
                                    !_obscureNotifier.value;
                              },
                              iconSize: 2.wp,
                              color: theme.colorScheme.secondary,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 2.hp),
                      ValueListenableBuilder(
                        valueListenable: _obscureConfirmNotif,
                        builder: (context, value, child) {
                          return Customtextfeild(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            obscureText: value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              onPressed: () {
                                _obscureConfirmNotif.value =
                                    !_obscureConfirmNotif.value;
                              },
                              iconSize: 2.wp,
                              color: theme.colorScheme.secondary,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 5.hp),

                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            // Navigator.pushNamed(context, '/home');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('signed up')),
                            ); // Success!
                          } else if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading)
                            return CircularProgressIndicator();
                          return GradientButton(
                            ontap: () {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Passwords do not match!'),
                                  ),
                                );
                                return;
                              }
                              context.read<AuthBloc>().add(
                                SignUpSubmitted(                                  
                                  email: emailController.text.trim(),
                                  name: nameCntroller.text,
                                  password: passwordController.text,
                                ),
                              );                             
                            },
                            text: CustomeText(
                              text: l10n.signUpButton,
                              themeStyle: theme.textTheme.titleMedium,
                              color: theme.colorScheme.background,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
