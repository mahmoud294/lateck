import 'package:flutter/material.dart';
import 'package:lateck/models/cartitem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.qunt;
    });
    return total;
  }

  void addItem(
      String idItem, double priceItem, String nameItem, String imgItem) {
    if (_items.containsKey(idItem)) {
      _items.update(
          idItem,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              img: existingCartItem.img,
              name: existingCartItem.name,
              price: existingCartItem.price,
              qunt: existingCartItem.qunt + 1));
    } else {
      _items.putIfAbsent(
          idItem,
          () => CartItem(
              id: DateTime.now().toString(),
              img: imgItem,
              name: nameItem,
              price: priceItem,
              qunt: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
