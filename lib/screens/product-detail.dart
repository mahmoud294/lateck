import 'package:flutter/material.dart';
import 'package:lateck/widgets/product-item-detail.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/productDetail';
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final idd = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,size: 30),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: ProductItem(idd)),
    );
  }
}
