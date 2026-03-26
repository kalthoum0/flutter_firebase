// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get loginTitle => 'صفحة تسجيل الدخول';

  @override
  String get signUpTitle => 'صفحة إنشاء حساب';

  @override
  String get userName => 'الاسم';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get signUpButton => 'إنشاء حساب';

  @override
  String get loginButton => 'تسجيل دخول';

  @override
  String get successMessage => 'تم إنشاء المستخدم بنجاح!';
}
