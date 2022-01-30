import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly/core/db/auth_shared_preferences.dart';

import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'utils/style.dart';
import 'utils/translations/app_translations.dart';
import 'view/intro/intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // await IsLogin.init();
  // if(IsLogin.getIsLoginValue() ==true){
  //   await TokenPref.init();
  // }else{
  //   return;
  // }
  await TokenPref.init();
  await UserNamePref.init();
  await ExpireDatePref.init();
  await UserPhonePref.init();
  await UserSSNPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fly',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        home: const IntroPage(),
        translations: Translation(),
        locale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
      ),
    );
  }
}
