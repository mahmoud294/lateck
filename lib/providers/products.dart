import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lateck/models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> get allProducts {
    return [..._allProducts];
  }

  Product selectedProduct(String id) {
    return _allProducts.firstWhere((prod)=> prod.id==id);
  }

  Future<void> fetchProduct() async {
    const url =
        'https://latech-a750c-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Product> loadedProducts = [];      
      extractedData.forEach((prodId, prodData) {
        List<String> cap = [];
        final test = prodData['capacity'] as List<dynamic>;
        test.forEach((data) {
          cap.add(data);
        });
        List<String> capcol = [];
        final test2 = prodData['colors'] as List<dynamic>;
        test2.forEach((data) {
          capcol.add(data);
        });
        List<String> imgs = [];
        final test3 = prodData['images'] as List<dynamic>;
        test3.forEach((data) {
          imgs.add(data);
        });
        loadedProducts.add(Product(
            capacity: cap,
            colors: capcol,
            id: prodId,
            imgLink: prodData['imgLink'],
            name: prodData['name'],
            images: imgs,
            price: prodData['price']));
      });
      _allProducts = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addProducts() async {
    const url =
        'https://latech-a750c-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.post(url,
          body: json.encode({
            'name': 'Iphone xs max',
            'imgLink':
                'https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-xs-max-5.jpg',
            'price': 198.15,
            'images': [
              'https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-xs-max-5.jpg',
              'https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-xs-max-3.jpg',
              'https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-xs-max-4.jpg',
              'https://www.gizmochina.com/wp-content/uploads/2018/09/Apple-iPhone-Xs-Max-503x503.png'
            ],
            'colors': ['Blue', 'black', 'red'],
            'capacity': ['128 Gb', '256 Gb', '64 Gb'],
          }));
    } catch (error) {
      print(error);
    }
  }
}
