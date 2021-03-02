import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lateck/providers/products.dart';
import 'package:lateck/screens/cartScreen.dart';
import 'package:lateck/widgets/allProduct.dart';
import 'package:lateck/widgets/banner.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket_sharp),
            onPressed: () =>
                Navigator.of(context).pushNamed(CartScreen.routeName),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(child: BannerTop()),
          // RaisedButton(
          //   child: Text('add product Dummy'),
          //   onPressed: () {
          //     Provider.of<Products>(context,listen: false).addProducts();
          //   },

          // ),
          Expanded(
              child: Container(
                  color: Colors.grey[200],
                  margin: EdgeInsets.all(13),
                  padding: EdgeInsets.all(13),
                  child: ProductWidget())),
        ],
      ),
    );
  }
}
