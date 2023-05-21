import "package:flutter/material.dart";
import 'package:listview_batch30/view/calc_view.dart';
import 'package:listview_batch30/view/output_view.dart';
import 'package:listview_batch30/view/student_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Details',
      initialRoute: '/',
      routes: {
        '/': (context) => CalcView(),
        '/stsview': (context) => const StudentView(),
        '/outputRoute': (context) => const OutputView(),
      },
    ),
  );
}
