import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuzik_app/ultility/interface/auth/otp_reset_password_function.dart';


class OtpResetPasswordController with ChangeNotifier implements IOtpResetPasswordFunction {
  OtpResetPasswordController();

  BuildContext? context;

  late TextEditingController otpController;

  bool isShowOtp = false;

  late Stopwatch timer;
  final int timeLimit = 90;

  void init(BuildContext context) {
    this.context = context;
    otpController = TextEditingController();
    timer = Stopwatch();

  }

  Duration get timeLeft {
    int timeLeft = timeLimit - timer.elapsed.inSeconds;
    if (timeLeft > 0) return Duration(seconds: timeLeft);
    return Duration.zero;
  }

  @override
  void createAccount() {
    // TODO: implement createAccount
  }

  @override
  void resendOtp() {
    // TODO: implement resendOtp
  }

  @override
  void setShowOtp() {
      isShowOtp = !isShowOtp;
      notifyListeners();
    // TODO: implement setShowOtp
  }
}
