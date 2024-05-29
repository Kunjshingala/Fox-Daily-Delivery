import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rxdart/subjects.dart';

class MainNavigationBloc {
  final BuildContext context;

  MainNavigationBloc({required this.context});

  final persistentTabController = PersistentTabController(initialIndex: 0);

  final pageSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getPage => pageSubject.stream;
  Function(int) get setPage => pageSubject.add;

  void dispose() {
    persistentTabController.dispose();
    pageSubject.close();
  }
}
