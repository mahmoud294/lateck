import 'package:flutter/material.dart';
import 'package:lateck/providers/cart.dart';
import 'package:lateck/screens/product-detail.dart';
import 'package:lateck/widgets/cartItem.dart';
import 'package:provider/provider.dart';

class CartItemsView extends StatefulWidget {
  @override
  _CartItemsViewState createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return cart.items.isEmpty
        ? Center(
            child: Text('No Item in Cart'),
          )
        : Container(
          height: 210,
          padding: EdgeInsets.only(top: 30),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) => CartItemWidget(
                prodId: cart.items.keys.toList()[index],
                id: cart.items.values.toList()[index].id,
                img: cart.items.values.toList()[index].img,
                name: cart.items.values.toList()[index].name,
                price: cart.items.values.toList()[index].price,
                qunt: cart.items.values.toList()[index].qunt,
              ),
            ),
        );
  }
}
