import 'package:flutter/material.dart';
import 'package:lateck/widgets/cartView.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,size: 30),
        backgroundColor: Colors.white,
        elevation: 0,
      ),body: Column(
        children: [
          CartItemsView(),
        ],
      ),);
  }
}
