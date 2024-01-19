import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ultility/interface/auth/otp_reset_password_function.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


class OtpResetPasswordController with ChangeNotifier implements IOtpResetPasswordFunction {
  OtpResetPasswordController();

  BuildContext? context;

  late TextEditingController tokenController;

  bool isShowOtp = false;

  JSON? resetPasswordInfo;

  Stopwatch timer  = Stopwatch()..start();
  final int timeLimit = 90;

  void init(BuildContext context) {
    this.context = context;
    tokenController = TextEditingController();
    resetPasswordInfo = GoRouterState.of(context).extra as JSON?;
  }

  int _timeLeft = 90;

  Duration get timeLeft {
    int time = timeLimit - timer.elapsed.inSeconds;
    if (time != _timeLeft && time >= 0) notifyListeners();
    _timeLeft = time;
    if (_timeLeft > 0) return Duration(seconds: _timeLeft);
    return Duration.zero;
  }

  String get timeLeftResult => DateFormat.ms().format(DateTime(2024).add(timeLeft));

  @override
  ///JSON need email and token
  void confirmOtp() async
  {
    try
    {
        print(timeLeft);
        if (timeLeft.inSeconds <= 0) throw "Mã OTP hết hạn";
        final tempJson = {'email' : resetPasswordInfo!['email'], 'token' : tokenController.text };
        await authRepo.resetPasswordConfirm(tempJson, resetPasswordInfo!['password']);
    }
    catch (e) {
      if (context != null){
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("Có lỗi xảy ra")));
      }
    }
    // TODO: implement createAccount
  }

  @override
  void resendOtp() async {
    await authRepo.resetPassword(resetPasswordInfo!['email']);
    timer.reset();
  }

  @override
  void setShowOtp() {
      isShowOtp = !isShowOtp;
      notifyListeners();
  }
}
