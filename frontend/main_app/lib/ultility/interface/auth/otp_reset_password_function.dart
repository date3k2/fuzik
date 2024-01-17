import 'dart:async';

import 'package:fuzik_app/models/json.dart';

abstract interface class IOtpResetPasswordFunction {
  void setShowOtp();
  void createAccount();
  void resendOtp();
}