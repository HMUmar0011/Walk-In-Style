import 'package:flutter/material.dart';
import 'package:walkinstyleapp/routes/routes.dart';
import 'package:walkinstyleapp/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashScreen(),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}