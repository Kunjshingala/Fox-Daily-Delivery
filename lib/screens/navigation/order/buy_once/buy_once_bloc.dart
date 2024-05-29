import 'package:flutter/material.dart';

class BuyOnceBloc {
  final BuildContext context;

  BuyOnceBloc({required this.context});

  List<BuyOnceModal> buyOnceList = [
    BuyOnceModal(
      id: 1231456789,
      date: 'TODAY at 6:00 pm',
      quantity: 1,
      price: 120,
    ),
    BuyOnceModal(
      id: 1231456789,
      date: '01/01/2023 at 6:00 pm',
      quantity: 3,
      price: 350,
    ),
    BuyOnceModal(
      id: 1231456789,
      date: '02/01/2023 at 6:00 pm',
      quantity: 2,
      price: 40,
    ),
    BuyOnceModal(
      id: 1231456789,
      date: '03/01/2023 at 6:00 pm',
      quantity: 5,
      price: 50,
    ),
    BuyOnceModal(
      id: 1231456789,
      date: '04/01/2023 at 6:00 pm',
      quantity: 6,
      price: 56,
    ),
    BuyOnceModal(
      id: 1231456789,
      date: '05/01/2023 at 6:00 pm',
      quantity: 9,
      price: 899,
    ),
  ];
}

class BuyOnceModal {
  final int id;
  final String date;
  final int quantity;
  final int price;

  BuyOnceModal({
    required this.id,
    required this.date,
    required this.quantity,
    required this.price,
  });
}
