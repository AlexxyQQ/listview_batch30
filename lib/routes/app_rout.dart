import 'package:listview_batch30/view/buttom_nav.dart';
import 'package:listview_batch30/view/dt_view.dart';
import 'package:listview_batch30/view/output_view.dart';
import 'package:listview_batch30/view/splash_screen.dart';
import 'package:listview_batch30/view/student_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String homeRoute = '/';
  static const String loginRoute = '/default';
  static const String studentRoute = '/stsview';
  static const String outputRoute = '/outputRoute';
  static const String dt = '/dt';

  static getAppRoutes() {
    return {
      homeRoute: (context) => const SplashScreen(),
      loginRoute: (context) => const BottomNav(),
      studentRoute: (context) => const StudentView(),
      outputRoute: (context) => const OutputView(),
      dt: (context) => const TimeDateView()
    };
  }
}
