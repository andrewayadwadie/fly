import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fly/core/db/auth_shared_preferences.dart';
import 'package:fly/core/service/orders_services.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/auth/login_screen.dart';
import 'package:fly/view/on_board/on_board_screen.dart';
import 'package:fly/view/shared_widgets/no_internet_screen.dart';
import 'package:get/get.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;
  final double _bigFontSize = kIsWeb ? 234 : 30;
  final transitionDuration = const Duration(seconds: 1);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 2))
        .then((value0) => setState(() => expanded = true))
        .then((value1) => const Duration(seconds: 2))
        .then(
          (value2) => Future.delayed(const Duration(seconds: 2)).then(
              (value3) => _lottieAnimation.forward().then((value4) =>
                  OrdersServices.getOrdersByPhone().then((checkValue) {
                    if (checkValue == 401) {
                      Get.offAll(const LoginScreen());
                    } else if (checkValue == 500) {
                      Get.offAll(const NoInternetScreen());
                    } else if (checkValue.runtimeType == List) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return TokenPref.getTokenValue().isEmpty
                            ? const LoginScreen()
                            : const OnBoardScreen();
                      }), (route) => false);
                    }
                  }))),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              ),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: const Color(0xFFffffff),
                fontSize: expanded ? _bigFontSize : 45,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              child: const Text(
                "?????????????? ?????????????? ????????????????",
                textAlign: TextAlign.center,
              ),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Column(
      children: const [
        Text(
          " ?????????? ???????????? ?????????????? ????????????????   ",
          style: TextStyle(
            color: Color(0xFFffffff),
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "?????????? ?????????? ???????????? ",
          style: TextStyle(
            color: Color(0xFFffffff),
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
