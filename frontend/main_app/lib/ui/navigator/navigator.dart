import 'package:fuzik_app/ui/pages/auth/auth.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    initialLocation: LoginPage.route.path,
    routes: [
        RegisterPage.route,
        LoginPage.route,
        ForgotPasswordPage.route,
        ResetPasswordPage.route,
      ]
);