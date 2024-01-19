import 'package:flutter/material.dart';
import 'package:fuzik_app/data/storage.dart';
import 'package:fuzik_app/ui/navigator/navigator.dart';
import 'package:fuzik_app/data/config_non_web.dart'
    if (dart.library.html) 'package:fuzik_app/data/config_web.dart';
import 'package:fuzik_app/ui/theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fuzik_app/ultility/controller/player/play_music_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PlayMusicController.init();
  storage = await SharedPreferences.getInstance();
  await dotenv.load();
  configureUrl();
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
