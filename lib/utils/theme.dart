import 'package:flutter/material.dart';

class AppThemes {
  static final Color pastelGreen = Color(0xFFFFEA00);

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.grey[700]),
    brightness: Brightness.light,
    primaryColor: pastelGreen,
    scaffoldBackgroundColor: Color(0xFFFEFFFE),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        shadowColor: Color(0xff2f2f2f)
        //elevation: 10
        ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF0D0D0D)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFFEA00),
      foregroundColor: Color(0xFF2F2F2F),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF2F2F2F),
      contentTextStyle: TextStyle(color: Colors.white),
      actionTextColor: Color(0xFFFFEA00),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: pastelGreen,
      inactiveTrackColor: Colors.grey,
      thumbColor: pastelGreen,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: pastelGreen,
        foregroundColor: Colors.black,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: pastelGreen,
        foregroundColor: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: pastelGreen, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.white), // Check mark color
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return pastelGreen; // Checked color
        }
        return Colors.grey; // Default color
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return pastelGreen;
        }
        return Colors.grey;
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          // ignore: deprecated_member_use
          return pastelGreen.withOpacity(0.5);
        }
        return Colors.grey;
      }),
      thumbColor: WidgetStateProperty.all(pastelGreen),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16),
      unselectedLabelStyle: TextStyle(fontFamily: 'Poppins-Medium'),
      labelColor: pastelGreen,
      unselectedLabelColor: Color(0xFFFEFFFE),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: pastelGreen, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey, // Light theme background
      selectedItemColor: pastelGreen,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    cardTheme: CardTheme(
      color: pastelGreen,
      shadowColor: Colors.black54,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.grey[700]),
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF212121),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2F2F2F),
        foregroundColor: Colors.white,
        elevation: 10),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFFFEFFFE)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF2F2F2F),
      foregroundColor: Color(0xFFFFEA00),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
      actionTextColor: Color(0xFFFFEA00),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: pastelGreen,
      inactiveTrackColor: Colors.grey,
      thumbColor: pastelGreen,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF2F2F2F),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2F2F2F),
        overlayColor: Color(0xFF0D0D0D),
        foregroundColor: pastelGreen,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFF2F2F2F),
        foregroundColor: pastelGreen,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2F2F2F),
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2F2F2F), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: pastelGreen, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.black),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return pastelGreen;
        }
        return Colors.grey;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return pastelGreen;
        }
        return Colors.grey;
      }),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          // ignore: deprecated_member_use
          return pastelGreen.withOpacity(0.5);
        }
        return Colors.grey;
      }),
      thumbColor: WidgetStateProperty.all(pastelGreen),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Poppins-Medium',
      ),
      labelColor: pastelGreen,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: pastelGreen, width: 2),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2F2F2F), // Dark theme background
      selectedItemColor: pastelGreen,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    cardTheme: CardTheme(
      color: Color(0xFF2F2F2F),
      shadowColor: Colors.black54,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
