import 'package:flutter/material.dart';
import 'package:fuzik_app/ui/pages/auth/auth.dart';
import 'package:fuzik_app/ui/pages/home/home.dart';
import 'package:fuzik_app/ui/pages/pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    initialLocation: HomePage.route.path,
    overridePlatformDefaultLocation: true,
    navigatorKey: navigationMainKey,
    routes: [
      RegisterPage.route,
      LoginPage.route,
      ForgotPasswordPage.route,
      ResetPasswordPage.route,
      MainPage.route,
      MusicPlayerPage.route,
          ProfilePage.route,
]);

final navigationMainKey = GlobalKey<NavigatorState>();