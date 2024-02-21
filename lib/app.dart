import 'package:flutter/material.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/splash/splash_screen.dart';
import 'package:walkinstyleapp/utilities/app_theme.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.myCustomTheme(),
      home:const SplashScreen(),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}