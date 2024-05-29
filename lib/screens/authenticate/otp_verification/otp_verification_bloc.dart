import 'package:flutter/material.dart';

class OtpVerificationBloc {
  final BuildContext context;

  OtpVerificationBloc({required this.context});

  final otpController = TextEditingController();

  void dispose() {
    otpController.dispose();
  }
}
