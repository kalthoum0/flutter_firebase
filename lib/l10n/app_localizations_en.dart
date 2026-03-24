// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Login Page';

  @override
  String get signUpTitle => 'Sign Up Page';

  @override
  String get emailLabel => 'Email Address';

  @override
  String get passwordLabel => 'Password';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get loginButton => 'Login';

  @override
  String get successMessage => 'User created successfully!';
}
