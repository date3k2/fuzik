import 'package:flutter/material.dart';
import 'package:fuzik_app/ui/navigator/navigator.dart';
import 'package:fuzik_app/ui/theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp.router(
      title: 'Fuzik',
      routerConfig: AppNavigator.router,
      darkTheme: AppThemes.nightTheme,
      themeMode: ThemeMode.dark,
    );
=======
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ResetPasswordPage());
>>>>>>> nhatminh-fronend-dev
  }
}
