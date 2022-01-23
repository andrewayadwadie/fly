import 'package:flutter/material.dart';
import 'package:fly/test_map_screen.dart';
import 'package:fly/view/home/home_screen.dart';
import 'package:fly/view/reports_categories/bug_report/bug_report_screen.dart';
import 'package:get/get.dart';

import 'utils/style.dart';
import 'utils/translations/app_translations.dart';
import 'view/intro/intro.dart';

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
      home: const IntroPage(),
      translations: Translation(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
   
    );
  }
}
