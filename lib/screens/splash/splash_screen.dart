import 'package:flutter/material.dart';
import 'package:walkinstyleapp/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    screenTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
    ///This is the method which will wait for 2 seconds to move on next page
  screenTimer() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, Routes.login);
    });
  }

}
