import 'package:flutter/material.dart';
import 'package:todoapp/core/colors/dark_colors.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: Color(0XFF15B86C),
    scaffoldBackgroundColor: DarkColors().mainColor,
    indicatorColor: Color(0XFFF6F7F9),
    cardColor: DarkColors().cardColor,
    disabledColor: Color(0XFFA0A0A0),
    hintColor: DarkColors().hintColor,
    focusColor: DarkColors().cardColor,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: DarkColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: DarkColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: DarkColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: DarkColors().titleColor,
        fontFamily: "Poppins",
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: DarkColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: DarkColors().titleColor,
        fontFamily: "Poppins",
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: DarkColors().titleColor,
        fontFamily: "Poppins",
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: DarkColors().titleColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: DarkColors().titleColor,
        fontFamily: "Poppins",
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0XFF9E9E9E);
        }
      }),
      trackColor: WidgetStatePropertyAll(Color(0XFF15B86C)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF15B86C),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0XFF15B86C);
        } else {
          return Color(0XFF2A2A2A);
        }
      }),
    ),
    cardTheme: CardThemeData(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: DarkColors().cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
    ),
    dividerTheme: DividerThemeData(color: Colors.white, thickness: 1),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
