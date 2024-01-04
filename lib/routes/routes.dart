import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/authentication/view/login_screen.dart';

abstract class Routes{
  static const login='/login';
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.login:
      return MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      },);
      default:
      return unDefinedRoute();
    }
  } 
  static Route<dynamic> unDefinedRoute(){
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('No Route Found!'),
      ),
      body: const Center(child: Text('No Route Found!'),),
    );
  },);
}
}
