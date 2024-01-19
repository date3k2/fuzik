import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ultility/interface/auth/forget_password_function.dart';
import 'package:fuzik_app/ultility/regex/regex.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordController with ChangeNotifier implements IForgetPasswordFunction
{

  bool isShowPassword = false;
  bool isShowRetypePassword = false;
  final GlobalKey<FormFieldState> key;
  ForgetPasswordController(this.key);
  BuildContext? context;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController resetPasswordController;
  void init(BuildContext context)
  {
      this.context = context;
      emailController = TextEditingController();
      passwordController = TextEditingController();
      resetPasswordController = TextEditingController();
  }


  @override
  void confirm() async
  {
      if (!(key.currentState?.validate()?? false))
        return;
      try {
        await authRepo.resetPassword(emailController.text);
        if (context != null) context?.push('/forget-password/otp', extra: {
          'email': emailController.text,
          'password': passwordController.text
        });
      }
      on String catch (e) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(e)));
      }
  }

  @override
  String? validateEmail(String? email)
  {
    // TODO: implement validateEmail
      if (email == null)
      return "Email không được để trống!";
     if (emailRegEx.hasMatch(email))
     {
        return null;
     }
    return "Vui lòng nhập email chính xác!";
  }

  @override
  String? validatePassword(String? password)
  {
    // TODO: implement validatePassword
    if (password == null) return "Vui lòng điền mật khẩu";
    if (passwordRegEx.hasMatch(password)) return null;
    return "Mật khẩu độ dài 8 và chỉ gồm các ký tự ngoài khoảng trắng";
  }

  @override
  String? validateRetypePassword(String? password)
  {
    // TODO: implement validateResetPassword
    if (password == null) return "Vui lòng điền lại mật khẩu";
    if (password == passwordController.text) return null;
    return "Mật khẩu nhập lại không đúng";
  }

  @override
  void setShowPassword() {
    // TODO: implement setShowPassword
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  @override
  void setShowRetypePassword() {
    // TODO: implement setShowRetypePassword
    isShowRetypePassword = !isShowRetypePassword;
    notifyListeners();
  }

}