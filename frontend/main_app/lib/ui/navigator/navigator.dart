import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Package used for UI
import 'package:home/home.dart';
import 'package:auth/auth.dart';

///Class contains routes of App
abstract class AppNavigator {
  static final GoRouter router = GoRouter(
      initialLocation: '/login',
      routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(
        path: '/',
        builder: (context, state) => MainApp(
            items: List.generate(
                4,
                (index) => NavigationDestination(
                      icon: Icon(Icons.account_circle),
                      label: 'Hello',
                    ))))
  ]);
}
