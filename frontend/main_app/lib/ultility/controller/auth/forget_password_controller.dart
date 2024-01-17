import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ultility/interface/auth/forget_password_function.dart';
import 'package:fuzik_app/ultility/regex/regex.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordController with ChangeNotifier implements IForgetPasswordFunction
{

  final GlobalKey<FormFieldState> key;
  ForgetPasswordController(this.key);
  BuildContext? context;
  late TextEditingController emailController;
  void init(BuildContext context)
  {
      this.context = context;
      emailController = TextEditingController();
  }


  @override
  void confirm() async
  {
      if (!(key.currentState?.validate()?? false))
        return;
      try {
        await authRepo.resetPassword(emailController.text);
        if (context != null) context?.push('/forget-password/otp', extra: emailController.text);
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

}