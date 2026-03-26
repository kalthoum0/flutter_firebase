import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screentasia/screentasia.dart';
import 'package:second_attempt/Home.dart';
import 'package:second_attempt/core/extensions/router/router.dart';
import 'package:second_attempt/feature/Auth/data/repositories/auth_repository_impl.dart';
import 'package:second_attempt/feature/Auth/data/sources/auth_remote_data_source.dart';
import 'package:second_attempt/feature/Auth/domain/repositories/auth_repository.dart';
import 'package:second_attempt/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:second_attempt/feature/Auth/domain/usecases/signup_usecase.dart';
import 'package:second_attempt/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:second_attempt/core/localization/presentation/bloc/language_bloc.dart';
import 'package:second_attempt/feature/Auth/presentation/page/login.dart';
import 'package:second_attempt/feature/StartUp/presentation/pages/startUp.dart';
import 'package:second_attempt/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final appRouter = AppRouter();
class MyApp extends StatelessWidget {
  final Locale? locale;
  const MyApp({this.locale, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) {
          final authRepo = AuthRepositoryImpl(AuthRemoteDataSource());
          return          
          AuthBloc(
            SignupUseCase(
              AuthRepositoryImpl(AuthRemoteDataSource())
            ),
            LoginUseCase(
              AuthRepositoryImpl(AuthRemoteDataSource())
            ),
            AuthRepositoryImpl (
              AuthRemoteDataSource ()
            )
          )..add(AuthCheckRequested());
        }
        )
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
             routerConfig: appRouter.config(),
            localizationsDelegates: const [
              AppLocalizations.delegate, // Your generated translations
              GlobalMaterialLocalizations.delegate, // Standard Flutter buttons
              GlobalWidgetsLocalizations.delegate, // Directionality (RTL)
              GlobalCupertinoLocalizations.delegate, // iOS style widgets
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            locale: state.locale,
            title: 'Flutter Demo',
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // FIXED: Added ColorScheme before .fromSeed
              colorScheme: ColorScheme.light(
                primary: Color(0xFF3B37D8),
                secondary: Color(0xFFE6A0FB),
                outline: Color(0xFFDDDCE0),
                background: Colors.white,
              ),
              useMaterial3: true,

              textTheme: GoogleFonts.cairoTextTheme().copyWith(
                titleLarge: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 16.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                titleMedium: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 14.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  color: Colors.black,
                  fontSize: 14.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                ),
                bodyMedium: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  color: Colors.black,
                  fontSize: 12.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                ),
                bodySmall: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  color: Colors.black,
                  fontSize: 12.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                ),
                labelLarge: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 14.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                labelMedium: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
