import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:second_attempt/l10n/app_localizations.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguageEvent>((event, emit) {
      // TODO: implement event handler
      emit(LanguageUpdated(event.newLocale));
    });
  }
}
