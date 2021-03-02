import 'package:flutter/material.dart';
import 'package:lateck/models/product.dart';
import 'package:lateck/screens/product-detail.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetail.routeName, arguments: data.id);
      },
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
                height: 145,
                color: Colors.white,
                width: double.maxFinite,
                child: Hero(
                  tag: data.id,
                  child: Image.network(
                    '${data.imgLink}',
                    fit: BoxFit.contain,
                  ),
                )),
          ),
          Container(
            color: Colors.white,
            child: GridTileBar(
              title: Text(
                "${data.name}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${data.price} \$",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
