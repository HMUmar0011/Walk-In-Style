import 'package:flutter/material.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/view/login_screen.dart';
import 'package:walkinstyleapp/screens/on_boarding/on_board_screen1/view/on_board_screen1.dart';

abstract class Routes{
  static const onBoardScreen='/onBoardScreen';
  static const login='/login';
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.login:
      return MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      },);
      case Routes.onBoardScreen:
      return CustomPageTransition(child: const OnBoardScreen());
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
class CustomPageTransition extends PageRouteBuilder {
  Widget child;
  CustomPageTransition({required this.child}):
  super(pageBuilder:(context, animation, secondaryAnimation) {
    return FadeTransition(opacity: animation,child: child,);
  },transitionDuration: const Duration(),
  reverseTransitionDuration: const Duration(),
  transitionsBuilder:(context, animation, secondaryAnimation, child) {
      return child;
    },);
  
}