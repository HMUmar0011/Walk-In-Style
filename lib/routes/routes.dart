import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/forgot_password/bloc/forgot_password_screen_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/forgot_password/view/forgot_password_screen.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/bloc/sign_in_screen_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/sign_in/view/login_screen.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/bloc/sign_up_screen_bloc.dart';
import 'package:walkinstyleapp/screens/authentication/sign_up/view/sign_up_screen.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/bloc/bottom_navigator_bloc.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/view/bottom_bar_screen.dart';
import 'package:walkinstyleapp/screens/home/view/home_screen.dart';
import 'package:walkinstyleapp/screens/my_profile/view/my_profile_screen.dart';
import 'package:walkinstyleapp/screens/on_boarding/cubit/page_view_cubit.dart';
import 'package:walkinstyleapp/screens/on_boarding/view/on_board_screen.dart';

abstract class Routes {
  static const onBoardScreen = '/onBoardScreen';
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgotPassword = '/forgotPassword';
  static const homeScreen = '/homeScreen';
  static const myProfileScreen = '/myProfile';
  static const bottomBarScreen = '/bottomBar';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => LoginScreenBloc(),
              child: const LoginScreen(),
            );
          },
        );
      case Routes.homeScreen:
        return CustomPageTransition(child: const HomeScreen());
      case Routes.bottomBarScreen:
        return CustomPageTransition(
            child:  BlocProvider(
          create: (context) => BottomNavigationBloc(),
          child: const BottomBarScreen(),
        ));
      case Routes.myProfileScreen:
        return CustomPageTransition(child: const MyProfileScreen());
      case Routes.onBoardScreen:
        return CustomPageTransition(
            child: BlocProvider<PageViewCubit>(
          create: (context) => PageViewCubit(),
          child: const OnBoardScreen(),
        ));
      case Routes.signUp:
        return CustomPageTransition(
            child: BlocProvider(
          create: (context) => SignUpBloc(),
          child: const SignUpScreen(),
        ));
      case Routes.forgotPassword:
        return CustomPageTransition(
            child: BlocProvider(
          create: (context) => ForgotPasswordScreenCubit(),
          child: const ForgotPasswordScreen(),
        ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('No Route Found!'),
          ),
          body: const Center(
            child: Text('No Route Found!'),
          ),
        );
      },
    );
  }
}

class CustomPageTransition extends PageRouteBuilder {
  Widget child;
  CustomPageTransition({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(),
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
}
