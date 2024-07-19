import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0xffB7935F);
  static Color darkPrimary = Color(0xff0F1424);
  static Color blackColor = Color(0xFF242424);
  static Color yellowColor = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.white54,
        secondary: blackColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: primaryColor,
        onBackground: Colors.grey,
        surface: Colors.blueGrey,
        onSurface: Colors.white),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primaryColor,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
        color: blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        color: Color(0xFFFFFFFF),
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: primaryColor,
        size: 30,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimary,
        onPrimary: Colors.white,
        secondary: yellowColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: yellowColor,
        onBackground: Colors.grey,
        surface: Colors.blueGrey,
        onSurface: Colors.white),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkPrimary,
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
        color: yellowColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
    ),
  );
}
