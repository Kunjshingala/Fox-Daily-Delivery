import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class IntroBloc {
  final BuildContext context;

  IntroBloc({required this.context});

  final carouselController = CarouselController();

  final carouselPageSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getCarouselPage => carouselPageSubject.stream;
  Function(int) get setCarouselPage => carouselPageSubject.add;

  void dispose() {
    carouselPageSubject.close();
  }
}
