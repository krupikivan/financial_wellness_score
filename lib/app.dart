import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Health Tracker',
      theme: AppTheme.themeData(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
