import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/bloc/bottom_navigator_bloc.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/bloc/bottom_navigator_event.dart';
import 'package:walkinstyleapp/screens/bottom_bar_navigator_screen/bloc/bottom_navigator_state.dart';
import 'package:walkinstyleapp/screens/favorite_screen/view/favorite_screen.dart';
import 'package:walkinstyleapp/screens/home/view/home_screen.dart';
import 'package:walkinstyleapp/screens/my_profile/view/my_profile_screen.dart';
import 'package:walkinstyleapp/screens/notification_screen/view/notification_screen.dart';
import 'package:walkinstyleapp/utilities/app_colors.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget>? _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const FavoriteScreen(),
      const NotificationScreen(),
      const MyProfileScreen(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc,BottomNavigationState>(
      builder: (context, state) {
        state as BottomNavigationInitial;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.shifting,
            currentIndex: state.index,
              elevation: 0,
              backgroundColor: Colors.transparent,
              unselectedItemColor: AppColors.grey,
              selectedItemColor: AppColors.btnColor,
              onTap: (value) {
                BlocProvider.of<BottomNavigationBloc>(context,listen: false)
                .add(BottomNavigationEvent(currentIndex:value));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorite',
                ),
         
              
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]),
          // floatingActionButton notch .
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
                backgroundColor: AppColors.btnColor,
                hoverElevation: 10,
                splashColor: AppColors.white.withOpacity(0.3),
                elevation: 8,
                child: const Icon(Icons.shopify_rounded,
                 size: 35),
                onPressed: () {}),
          ),
          // Generate Widgets List .
          body: _pages?[state.index],
        );
      },
    );
  }
}
