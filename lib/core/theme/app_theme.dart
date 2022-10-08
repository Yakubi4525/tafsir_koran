import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:google_fonts/google_fonts.dart';



class AppTheme {
  static ThemeData getLightTheme(){
    return ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: whiteColor,
        fontFamily: GoogleFonts.varela().fontFamily,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            color: secondaryColor,
            fontSize: 14,
          ),
          subtitle2: TextStyle(
            color: whiteColor,
            fontSize: 14,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: whiteColor,
          elevation: 0,
        ),
        primaryIconTheme: IconThemeData(
          color: secondaryColor,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
  }
}