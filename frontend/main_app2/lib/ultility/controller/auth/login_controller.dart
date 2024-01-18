import 'package:flutter/material.dart';
import 'package:fuzik_app/data/storage.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/auth_repo.dart';
import 'package:fuzik_app/repositories/base.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ultility/interface/auth/login_function.dart';
import 'package:fuzik_app/ultility/regex/regex.dart';
import 'package:go_router/go_router.dart';

class LoginController with ChangeNotifier implements ILoginFunction {
  final GlobalKey<FormState> key;

  LoginController(this.key);

  BuildContext? context;

  FormState? get form => key.currentState;

  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool isSaveLogin = false;
  bool isShowPassword = false;

  void init(BuildContext context) {
    this.context = context;
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void createAccount() {
    context?.pushNamed('register');
  }

  @override
  void forgetPassword() {
    context?.pushNamed('forgotPassword');
  }

  @override
  void login() async {
    if (!validateForm()) return;
    print(loginForm);
    try {
      final token = await authRepo.login(loginForm);
      addAuth(token.accessToken);
      if (isSaveLogin) saveToken(token);
      context?.pushNamed('home');
    } on String catch (e) {
      if (context != null) {
        ScaffoldMessenger.of(context!)
            .showSnackBar(SnackBar(content: Text(e)));
      }
    } catch (e) {
      if (context != null) {
        ScaffoldMessenger.of(context!)
            .showSnackBar(SnackBar(content: Text("Có lỗi xảy ra")));
      }
    }
  }

  @override
  bool validateForm() {
    return form?.validate() ?? false;
  }

  @override
  void saveLogin(bool? result) {
    isSaveLogin = result ?? false;
    notifyListeners();
  }

  @override
  void setShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  @override
  String? validateEmail(String? email) {
    if (email == null) return null;
    if (emailRegEx.hasMatch(email)) return null;
    return "Tên đăng nhập phải là email";
  }

  @override
  String? validatePassword(String? password) {
    if (password == null) return null;
    if (passwordRegEx.hasMatch(password)) return null;
    return "Mật khẩu không chính xác";
  }

  @override
  JSON get loginForm => {
        "username": usernameController.text,
        "password": passwordController.text
      };
}
