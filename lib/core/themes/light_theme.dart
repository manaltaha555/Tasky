import 'package:flutter/material.dart';
import 'package:todoapp/core/colors/light_colors.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: Color(0XFF15B86C),
    scaffoldBackgroundColor: LightColors().mainColor,
    indicatorColor: Color(0XFF181818),
    cardColor: LightColors().cardColor,
    disabledColor: Color(0XFF6A6A6A),
    hintColor: LightColors().hintColor,
    focusColor: LightColors().borderCard,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: LightColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: LightColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: LightColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: LightColors().titleColor,
        fontFamily: "Poppins",
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: LightColors().subtitleColor,
        fontFamily: "Poppins",
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: LightColors().titleColor,
        fontFamily: "Poppins",
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: LightColors().titleColor,
        fontFamily: "Poppins",
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: LightColors().titleColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: LightColors().titleColor,
        fontFamily: "Poppins",
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0XFF15B86C);
        } else {
          return Color(0XFF9E9E9E);
        }
      }),
      trackColor: WidgetStatePropertyAll(Colors.white),
      trackOutlineColor: WidgetStatePropertyAll(Color(0XFF9E9E9E)),
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
          return Colors.white;
        }
      }),
      side: BorderSide(color: Color(0XFFD1DAD6)),
    ),
    dividerTheme: DividerThemeData(color: Color(0XFF6A6A6A), thickness: 1),
    iconTheme: IconThemeData(color: Color(0XFF3A4640)),
    cardTheme: CardThemeData(
      color: LightColors().cardColor,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
        side: BorderSide(color: LightColors().borderCard, width: 2),
      ),
    ),
  );
}
