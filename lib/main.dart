import "package:flutter/material.dart";
import 'package:listview_batch30/routes/app_rout.dart';
import 'package:listview_batch30/themes/app_themes.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.getAppTheme(),
      title: 'Student Details',
      initialRoute: AppRoutes.homeRoute,
      routes: AppRoutes.getAppRoutes(),
    ),
  );
}
