import 'package:flutter/material.dart';
import 'package:listview_batch30/themes/color_constants.dart';

class AppThemes {
  AppThemes._();

  static getAppTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: ColorConstants.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConstants.appBarColor,
        centerTitle: true,
        toolbarHeight: 70,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          maximumSize: const Size(double.infinity, 50),
          foregroundColor: Colors.red,
          backgroundColor: ColorConstants.primaryColor,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      fontFamily: 'Montserrat',
      useMaterial3: true,
    );
  }
}
