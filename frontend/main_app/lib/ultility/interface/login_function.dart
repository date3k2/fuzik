import 'package:fuzik_app/models/json.dart';

abstract interface class ILoginFunction {
  bool validateForm();
  void forgetPassword();
  void login();
  void createAccount();
  void saveLogin(bool? result);
  void setShowPassword();
  String? validateEmail(String? email);
  String? validatePassword(String? password);
  JSON get loginForm;
}