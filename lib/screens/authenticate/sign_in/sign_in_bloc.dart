import 'package:flutter/material.dart';

class SignInBloc {
  final BuildContext context;

  SignInBloc({required this.context});

  final countryCodeController = TextEditingController();
  final numberController = TextEditingController();

  void dispose() {
    countryCodeController.dispose();
    numberController.dispose();
  }
}
