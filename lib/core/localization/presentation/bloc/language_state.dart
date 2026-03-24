part of 'language_bloc.dart';


@immutable
sealed class LanguageState {
  final Locale locale;

  const LanguageState(this.locale);  
}

final class LanguageInitial extends LanguageState {
  const LanguageInitial() : super(const Locale('en'));
}

final class LanguageUpdated extends LanguageState {
  const LanguageUpdated(super.locale);
}

