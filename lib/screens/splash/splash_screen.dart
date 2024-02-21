import 'package:flutter/material.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/utilities/constants.dart';

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
    screenSize=MediaQuery.sizeOf(context);
    return Container(
      color: Colors.black,
      child: Image.asset('assets/images/Splash1.jpg',
      fit: BoxFit.fill,),
    );
  }
    ///This is the method which will wait for 2 seconds to move on next page
  screenTimer() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, Routes.bottomBarScreen);
    });
  }

}
