import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final BuildContext context;

  HomeBloc({required this.context});

  final productTextController = TextEditingController();

  final firstCarouselController = CarouselController();

  final carouselPageSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getCarouselPage => carouselPageSubject.stream;
  Function(int) get setCarouselPage => carouselPageSubject.add;

  List<HomeGridItemModal> homeGridItemList = [
    HomeGridItemModal(image: 'assets/images/home/milk.png', label: 'Milk'),
    HomeGridItemModal(image: 'assets/images/home/eggs.png', label: 'Eggs'),
    HomeGridItemModal(image: 'assets/images/home/bread.png', label: 'Bread'),
    HomeGridItemModal(image: 'assets/images/home/dairy.png', label: 'Dairy'),
    HomeGridItemModal(image: 'assets/images/home/juices.png', label: 'Juices'),
    HomeGridItemModal(image: 'assets/images/home/vegetables.png', label: 'Vegetables'),
    HomeGridItemModal(image: 'assets/images/home/fruits.png', label: 'Fruits'),
    HomeGridItemModal(image: 'assets/images/home/meat.png', label: 'Meat'),
    HomeGridItemModal(image: 'assets/images/home/coconut_water.png', label: 'Coconut'),
  ];

  List<FeaturedProductModal> homeFeaturedItemList = [
    FeaturedProductModal(
      image: 'assets/images/home/milk_carton.png',
      label: 'Cow Milk',
      category: 'Milk',
      quantity: '1 L.',
      actualPrice: '\$ 40.00',
      discountPrice: '\$ 38.11',
    ),
    FeaturedProductModal(
      image: 'assets/images/home/milk_carton.png',
      label: 'Cow Milk',
      category: 'Milk',
      quantity: '1 L.',
      actualPrice: '\$ 40.00',
      discountPrice: '\$ 38.11',
    ),
    FeaturedProductModal(
      image: 'assets/images/home/milk_carton.png',
      label: 'Cow Milk',
      category: 'Milk',
      quantity: '1 L.',
      actualPrice: '\$ 40.00',
      discountPrice: '\$ 38.11',
    ),
    FeaturedProductModal(
      image: 'assets/images/home/milk_carton.png',
      label: 'Cow Milk',
      category: 'Milk',
      quantity: '1 L.',
      actualPrice: '\$ 40.00',
      discountPrice: '\$ 38.11',
    ),
    FeaturedProductModal(
      image: 'assets/images/home/milk_carton.png',
      label: 'Cow Milk',
      category: 'Milk',
      quantity: '1 L.',
      actualPrice: '\$ 40.00',
      discountPrice: '\$ 38.11',
    ),
  ];

  void dispose() {
    productTextController.dispose();
    firstCarouselController.stopAutoPlay();
    carouselPageSubject.close();
  }
}

class HomeGridItemModal {
  final String image;
  final String label;

  HomeGridItemModal({required this.image, required this.label});
}

class FeaturedProductModal {
  final String image;
  final String label;
  final String category;
  final String quantity;
  final String actualPrice;
  final String discountPrice;

  FeaturedProductModal({
    required this.image,
    required this.label,
    required this.category,
    required this.quantity,
    required this.actualPrice,
    required this.discountPrice,
  });
}
