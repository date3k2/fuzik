abstract interface class ILoginFunction {
  bool validateForm();
  void forgetPassword();
  void login();
  void createAccount();
  void saveLogin(bool? result);
  void setShowPassword();
}