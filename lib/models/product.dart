import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String name;
  double price;
  String imgLink;
  List<String> colors;
  List<String> images;
  List<String> capacity;
  Product(
      {this.capacity,
      this.colors,
      this.id,
      this.imgLink,
      this.name,
      this.images,
      this.price});
}
