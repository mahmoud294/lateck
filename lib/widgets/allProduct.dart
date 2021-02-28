import 'package:flutter/material.dart';
import 'package:lateck/providers/products.dart';
import 'package:lateck/widgets/productItem.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Products>(context, listen: false).fetchProduct(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Consumer<Products>(
          builder: (ctxx, value, child) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: value.allProducts.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(value:value.allProducts[index] ,child:ProductItem() ,),
          ),
        );
      },
    );
  }
}
