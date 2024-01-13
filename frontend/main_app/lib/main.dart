import 'package:flutter/material.dart';
import 'package:fuzik_app/ui/navigator/navigator.dart';
import 'package:fuzik_app/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fuzik',
      routerConfig: AppNavigator.router,
      darkTheme: AppThemes.nightTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
