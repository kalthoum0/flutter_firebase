part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final Locale newLocale;

  // Constructor requires the new locale
  ChangeLanguageEvent(this.newLocale);
}