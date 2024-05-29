import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyPreferencesBloc {
  final BuildContext context;

  MyPreferencesBloc({required this.context});

  List<String> languageList = ['English', 'French', 'Spanish', 'German'];

  List<String> currencyList = ['USD \$', 'Pound £', 'Euro €'];

  final selectedLanguageIndexSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getSelectedLanguageIndex => selectedLanguageIndexSubject.stream;
  Function(int) get setSelectedLanguageIndex => selectedLanguageIndexSubject.add;

  final selectedCurrencyIndexSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getSelectedCurrencyIndex => selectedCurrencyIndexSubject.stream;
  Function(int) get setSelectedCurrencyIndex => selectedCurrencyIndexSubject.add;

  void dispose() {
    selectedLanguageIndexSubject.close();
    selectedCurrencyIndexSubject.close();
  }
}
