import 'package:financial_wellness_score/utils/enum.dart';
import 'package:flutter/material.dart';

import '../presentation/views/financial_form.dart';
import '../presentation/views/financial_result.dart';
import '../presentation/views/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String financialForm = '/financialForm';
  static const String financialResult = '/result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _getPageRoute(
          child: const SplashScreen(),
        );
      case financialForm:
        return _getPageRoute(
          child: const FinancialForm(),
        );
      case financialResult:
        final result = settings.arguments as FinancialStatus;
        return _getPageRoute(
          child: FinancialResult(result: result),
        );
      default:
        return _getPageRoute(
          child: const SplashScreen(),
        );
    }
  }
}

PageRouteBuilder _getPageRoute({
  Widget? child,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child!,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
