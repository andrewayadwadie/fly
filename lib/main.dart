import 'package:flutter/material.dart';
import './view/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import 'utils/style.dart';
import 'utils/translations/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fly',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: const SplashScreen(),
      translations: Translation(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
    );
  }
}
