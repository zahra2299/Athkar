import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0xffB7935F);
  static Color blackColor = Color(0xFF242424);

  static ThemeData lightTheme = ThemeData(
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
  static ThemeData darkTheme = ThemeData();
}
