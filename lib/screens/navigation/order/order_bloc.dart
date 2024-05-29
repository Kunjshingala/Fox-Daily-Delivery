import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class OrderTabBarBloc {
  final BuildContext context;
  final TickerProvider tickerProvider;

  OrderTabBarBloc({required this.context, required this.tickerProvider}) {
    /// initially set days of default month.
    getDaysInMonth(selectedMonthSubject.value, year);
  }

  late TabController tabController = TabController(initialIndex: 0, vsync: tickerProvider, length: 2);

  final primaryTabIndexSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getPrimaryTabIndex => primaryTabIndexSubject.stream;
  Function(int) get setPrimaryTabIndex => primaryTabIndexSubject.add;

  final selectedMonthSubject = BehaviorSubject<int>.seeded(1);
  Stream<int> get getSelectedMonth => selectedMonthSubject.stream;
  Function(int) get setSelectedMonth => selectedMonthSubject.add;

  final daysInSelectedMonthSubject = BehaviorSubject<int>.seeded(1);
  Stream<int> get getDaysInSelectedMonth => daysInSelectedMonthSubject.stream;
  Function(int) get setDaysInSelectedMonth => daysInSelectedMonthSubject.add;

  List<dynamic> mothList = [
    {"id": 1, "value": "Jan."},
    {"id": 2, "value": "Feb."},
    {"id": 3, "value": "Mar."},
    {"id": 4, "value": "Apr."},
    {"id": 5, "value": "May."},
    {"id": 6, "value": "Jun."},
    {"id": 7, "value": "Jul."},
    {"id": 8, "value": "Aug."},
    {"id": 9, "value": "Sep."},
    {"id": 10, "value": "Oct."},
    {"id": 11, "value": "Nov."},
    {"id": 12, "value": "Dec."}
  ];

  final year = 2024;

  void getDaysInMonth(int month, int year) {
    /// get and set days of particular month in stream.
    int daysInMonth =
        DateTimeRange(start: DateTime(year, month, 1), end: DateTime(year, month + 1)).duration.inDays;

    setDaysInSelectedMonth(daysInMonth);
  }

  void dispose() {
    tabController.dispose();
    primaryTabIndexSubject.close();
    daysInSelectedMonthSubject.close();
    selectedMonthSubject.close();
  }
}
