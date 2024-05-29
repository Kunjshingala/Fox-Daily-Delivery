import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';

import 'subscription_widgets.dart';

class SubscriptionBloc {
  final BuildContext context;

  SubscriptionBloc({required this.context});

  List<DaysListModal> dayList = [];
  List<DaysTab> daysTabList = [];
  List<SubscriptionPage> pageList = [];

  late TabController tabController;

  final pageSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getPage => pageSubject.stream;
  Function(int) get setPage => pageSubject.add;

  final selectedTabSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getSelectedTab => selectedTabSubject.stream;
  Function(int) get setSelectedTab => selectedTabSubject.add;

  void getListOfDays(int days, int month, int year, TickerProvider tickerProvider) {
    debugPrint('-------------getListOfDays------------->called');

    dayList = [];
    daysTabList = [];
    pageList = [];

    List.generate(
      days,
      (index) {
        final dayName = DateFormat('E').format(DateFormat("DD MM yyyy").parse('${index + 1} $month $year'));

        dayList.add(DaysListModal(date: (index + 1), dateName: dayName, month: month, year: year));

        daysTabList.add(DaysTab(date: (index + 1), dayName: dayName, subscriptionBloc: this));

        pageList.add(SubscriptionPage(subscriptionBloc: this));
      },
    );

    updateTab(daysTabList.length, tickerProvider);
  }

  void updateTab(int tabNumber, TickerProvider tickerProvider) {
    try {
      tabController = TabController(initialIndex: 0, length: tabNumber, vsync: tickerProvider);

      tabController.addListener(() {
        setSelectedTab(tabController.index);
      });
    } catch (e) {
      debugPrint('-------------getListOfDays------------->$e');
    }
  }

  void dispose() {
    pageSubject.close();
    tabController.dispose();
    selectedTabSubject.close();
    tabController.dispose();
  }
}

class DaysListModal {
  final int date;
  final String dateName;
  final int month;
  final int year;

  DaysListModal({required this.date, required this.dateName, required this.month, required this.year});
}
