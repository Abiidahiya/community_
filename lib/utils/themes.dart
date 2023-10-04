import 'package:flutter/material.dart';


final ColorScheme lightColorScheme = ColorScheme.light(
  primary: Color(0xFF66c0c1), // Sea green primary color
  secondary: Color(0xFF009698), // Sea green secondary color
  background: Color(0xFFF2F2F2), // Light background color
  surface: Color(0xFFFFFFFF), // Light surface color
  error: Color(0xFFD32F2F), // Error color
  onPrimary: Color(0xFFFFFFFF), // Text and icons on sea green primary color
  onSecondary: Color(0xFFFFFFFF), // Text and icons on sea green secondary color
  onBackground: Color(0xFF333333), // Text and icons on background color
  onSurface: Color(0xFF333333), // Text and icons on surface color
  onError: Color(0xFFFFFFFF), // Text and icons on error color
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.background, // Background color for the app
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary, // App bar background color
    titleTextStyle: TextStyle(
      color: lightColorScheme.onPrimary, // App bar text color
      fontSize: 20, // App bar title font size
    ),
  ),
  textTheme: TextTheme(
    // Define text styles for various text elements
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary, // Headline text color
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      color: lightColorScheme.primary, // Subtitle text color
    ),
    // Add more text styles as needed
  ),
);
final ColorScheme darkColorScheme = ColorScheme.dark(
  primary: Color(0xFF4A9D32), // Your primary color
  secondary: Color(0xFF693411), // Your secondary color
  background: Color(0xFF1E1E1E), // Slightly lighter background color
  surface: Color(0xFF333333), // Slightly lighter surface color
  error: Color(0xFFC1272D), // Error color
  onPrimary: Color(0xFFFFFFFF), // Text and icons on primary color
  onSecondary: Color(0xFFFFFFFF), // Text and icons on secondary color
  onBackground: Color(0xFFFFFFFF), // Text and icons on background color
  onSurface: Color(0xFFFFFFFF), // Text and icons on surface color
  onError: Color(0xFFFFFFFF), // Text and icons on error color
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.background, // Background color for the app
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.background, // App bar background color
    titleTextStyle: TextStyle(
      color: Colors.white, // App bar text color
      fontSize: 20, // App bar title font size
    ),
  ),
  textTheme: TextTheme(
    // Define text styles for various text elements
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Headline text color
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      color: Colors.white, // Subtitle text color
    ),
    // Add more text styles as needed
  ),
);