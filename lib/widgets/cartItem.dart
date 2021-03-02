import 'package:flutter/material.dart';
import 'package:lateck/providers/cart.dart';
import 'package:lateck/screens/product-detail.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String prodId;
  final String name;
  final double price;
  final int qunt;
  final String img;
  CartItemWidget(
      {this.id, this.img, this.name, this.price, this.prodId, this.qunt});
  @override
  Widget build(BuildContext context) {
    final del = Provider.of<Cart>(context, listen: false);
    return Container(
      height: 140,

      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                      height: 145,
                      color: Colors.white,
                      // width: double.maxFinite,
                      child: Image.network(
                        '$img',
                        fit: BoxFit.contain,
                      )),
                ),
                Positioned(
                  top: -6,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: ()=> 
                      del.removeItem(prodId)
                    ,
                  ),
                )
              ],
              overflow: Overflow.visible,              
            ),
          ),
          Container(
            height: 90,
            width: 190,
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  '$name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '$price',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(padding: EdgeInsets.all(12),child: Text('X $qunt'),color: Colors.blue[100],)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
