import 'package:flutter/cupertino.dart';
import 'package:fuzik_app/ultility/interface/auth/forget_password_function.dart';
import 'package:fuzik_app/ultility/regex/regex.dart';

class ForgetPasswordController with ChangeNotifier implements IForgetPasswordFunction
{

  final GlobalKey<FormState> key;
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
      if (key.currentState?.validate()??false)
        return;

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