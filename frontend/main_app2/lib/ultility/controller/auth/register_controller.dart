import 'package:flutter/material.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ui/pages/loading_page.dart';
import 'package:fuzik_app/ultility/interface/auth/register_function.dart';
import 'package:fuzik_app/ultility/regex/regex.dart';
import 'package:go_router/go_router.dart';

class RegisterController with ChangeNotifier implements IRegisterFunction {
  final GlobalKey<FormState> key;

  RegisterController(this.key);

  BuildContext? context;

  FormState? get form => key.currentState;

  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController retypeController;

  int? gender;
  final genderMap = {0: 'Nam', 1: 'Nữ', 2: 'Khác'};
  bool isShowRetypePassword = false;
  bool isShowPassword = false;

  void init(BuildContext context) {
    this.context = context;
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    retypeController = TextEditingController();
  }

  @override
  void createAccount() async {
    if (!validateForm()) return;
    print(registerForm);
    try {
      Navigator.of(context!).push(LoadingOverlay());
      final result = await authRepo.signUp(registerForm);
      context?.pushNamed('register-otp');
    } on String catch (e) {
      if (context != null) {
        context?.pop();
        ScaffoldMessenger.of(context!)
            .showSnackBar(SnackBar(content: Text(e)));
      }
    } catch (e) {
      if (context != null) {
        context?.pop();
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
  String? validateEmail(String? email) {
    if (email?.isEmpty ?? false) return "Tên email không được để trống";
    if (emailRegEx.hasMatch(email!)) return null;
    return "Email bạn nhập không chính xác";
  }

  @override
  String? validateGender(int? gender) {
    if (gender == null) return "Vui lòng chọn giới tính";
    return null;
  }

  @override
  String? validateName(String? name) {
    if (name == null) return "Họ và tên không được để trống";
    return null;
  }

  @override
  String? validatePassword(String? password) {
    if (password == null) return "Vui lòng điền mật khẩu";
    if (passwordRegEx.hasMatch(password)) return null;
    return "Mật khẩu độ dài 8 và chỉ gồm các ký tự ngoài khoảng trắng";
  }

  @override
  String? validateRetypePassword(String? retype) {
    if (retype == passwordController.text) return null;
    return "Mật khẩu nhập lại không chính xác";
  }

  @override
  void setPasswordShow() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  @override
  void setRetypePasswordShow() {
    isShowRetypePassword = !isShowRetypePassword;
    notifyListeners();
  }

  @override
  JSON get registerForm => {
        'email': emailController.text,
        'name': nameController.text,
        'gender': gender,
        'password': passwordController.text
      };

  @override
  void changeGender(int? gender) {
    if (gender != null) this.gender = gender;
  }
}
