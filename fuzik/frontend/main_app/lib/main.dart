import 'package:fuzik_app/ui/pages/auth/auth.dart';
import 'package:fuzik_app/ui/pages/player/player.dart';
import 'package:fuzik_app/ui/pages/information/information.dart';
<<<<<<< HEAD
=======
import 'package:fuzik_app/ui/pages/event/event.dart';
>>>>>>> nhatminh-fronend-dev

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
<<<<<<< HEAD
        home: ProfilePage());
=======
        home: SearchEventPage());
>>>>>>> nhatminh-fronend-dev
  }
}