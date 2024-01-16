import 'package:fuzik_app/ui/pages/auth/auth.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
      routes: [
        RegisterPage.route,
        AuthCreateAccountPage.route,
        LoginPage.route,
        RegisterPage.route,
        ResetPasswordPage.route,
      ]
);