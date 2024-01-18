import 'package:fuzik_app/models/json.dart';

abstract interface class IRegisterFunction {
  bool validateForm();
  void createAccount();
  String? validateEmail(String? email);
  String? validateName(String? name);
  void changeGender(int? gender);
  String? validateGender(int? gender);
  String? validatePassword(String? password);
  String? validateRetypePassword(String? retype);
  void setPasswordShow();
  void setRetypePasswordShow();
  JSON get registerForm;
}