import 'package:flutter/material.dart';
import 'package:fuzik_app/data/storage.dart';
import 'package:fuzik_app/ui/navigator/navigator.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:fuzik_app/ui/theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  storage = await SharedPreferences.getInstance();
  await dotenv.load();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Fuzik',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: AppThemes.nightTheme,
      themeMode: ThemeMode.dark,
      routerConfig: router,
      builder: (context, widget) => Sizer(
        builder: (context, orientation, device) => widget ?? const Scaffold(),
      ),
    );
  }
}
