import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:second_attempt/feature/Auth/presentation/page/login.dart';
import 'package:second_attempt/my_app.dart';
import 'firebase_options.dart';
import 'package:screentasia/screentasia.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  usePathUrlStrategy();
  runApp(
    ScreentasiaInit(
      builder: (context, child) {
        return DevicePreview(
          enabled: !kReleaseMode,
          // This builder gives us the 'context' containing the selected language
          builder: (context) => MyApp(
            // We pass the locale from DevicePreview to MyApp
            locale: DevicePreview.locale(context), 
          ),
        );
      },
    ),
  );
}


