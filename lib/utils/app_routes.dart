import 'package:fly/view/auth/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/welcome-screen";
  static String loginScreen = "/Login-screen";

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
  ];
}
