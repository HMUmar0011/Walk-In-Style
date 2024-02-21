import 'package:flutter/material.dart';




abstract class AppColors {
  // Background Colors
 static Color drawerBackgroundColor = const Color.fromARGB(255, 22, 37, 48);

  // Error and Default Colors
 static Color errorColor = Colors.red;
 static const Color white = Colors.white;
 static Color grey = Colors.grey;
  // Button Colors
 static const Color btnColor =  Color.fromARGB(255, 51, 160, 255);

 // Text Colors

 static Color largeTextColor = const Color.fromARGB(255, 56, 68, 78);
 static Color titleTextColors = const Color.fromARGB(255, 109, 123, 129);
 static Color backgroundAppColor = const Color.fromARGB(255, 248, 249, 250);

  // Dialog and Bottom Sheet Barrier Colors
 static Color barrierColor = const Color.fromARGB(255, 144, 151, 157);

  // Primary and Secondary Colors
 static Color primaryColor = const Color.fromARGB(255, 0, 123, 255);
 static Color secondaryColor = const Color.fromARGB(255, 255, 152, 0);

  // Accent Colors
 static Color accentColor = const Color.fromARGB(255, 255, 64, 129);

  // Border Colors
 static Color borderColor = const Color.fromARGB(255, 200, 200, 200);

  // Placeholder Color for TextFields
 static Color placeholderColor = const Color.fromARGB(255, 180, 180, 180);

  // Icon Colors
 static const Color iconColor =  Color.fromARGB(255, 85, 93, 96);

  // Success and Warning Colors
  static Color successColor = const Color.fromARGB(255, 0, 200, 83);
  static Color warningColor = const Color.fromARGB(255, 255, 185, 0);

  // Dark Mode Colors
 static Color darkModeBackground = const Color.fromARGB(255, 20, 20, 20);
 static Color darkModeText = const Color.fromARGB(255, 240, 240, 240);

  // Navigation Bar Colors
 static Color navBarBackground = const Color.fromARGB(255, 0, 123, 255);
 static Color navBarText = Colors.white;

  // Tab Bar Colors
  static Color tabBarBackground = const Color.fromARGB(255, 248, 249, 250);
  static Color tabBarIconInactive = const Color.fromARGB(255, 56, 68, 78);
  static Color tabBarIconActive = const Color.fromARGB(255, 0, 123, 255);

  // Loading Indicator Color
 static Color loadingIndicatorColor = const Color.fromARGB(255, 51, 160, 255);
}
