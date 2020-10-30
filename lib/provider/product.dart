import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  String id;
  final String image;
  final String title;
  final double price;
  final bool sale;
  final String desc;
  final String category;
  bool isFavourite;

  Product(
      {this.id,
      this.title,
      this.image,
      this.category,
      this.sale,
      this.price,
      this.desc,
      this.isFavourite =false});

  void toggleFavourite(
      {
      bool isFavourite}) {
    final oldValue = isFavourite;
    isFavourite = !isFavourite;

    notifyListeners();
  }
}
