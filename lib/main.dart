import 'package:flutter/material.dart';
import 'package:lateck/providers/cart.dart';
import 'package:lateck/providers/products.dart';
import 'package:lateck/screens/cartScreen.dart';
import 'package:lateck/screens/home.dart';
import 'package:lateck/screens/login.dart';
import 'package:lateck/screens/onBoard.dart';
import 'package:lateck/screens/product-detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          routes: {
            LoginScreen.routeName: (ctx) => LoginScreen(),
            ProductDetail.routeName: (ctx) => ProductDetail(),
            CartScreen.routeName: (ctx) => CartScreen(),
          }),
    );
  }
}
