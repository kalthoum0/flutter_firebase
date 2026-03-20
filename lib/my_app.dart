import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:second_attempt/Home.dart';
import 'package:second_attempt/feature/login/presentation/page/login.dart';
import 'package:second_attempt/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  final Locale? locale;
  const MyApp({
    this.locale,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      locale: locale,
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner : false ,
      theme: ThemeData(        
        // FIXED: Added ColorScheme before .fromSeed
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage()
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
