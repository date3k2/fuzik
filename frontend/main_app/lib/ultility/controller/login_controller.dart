import 'package:flutter/material.dart';
import 'package:fuzik_app/ultility/interface/login_function.dart';
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
    context?.pushNamed('home');
  }

  @override
  bool validateForm() {
    form?.validate();
    throw UnimplementedError();
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

}