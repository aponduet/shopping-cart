import 'package:cartapp/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart';
import 'package:cartapp/models/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => DataStore(),
    //   child: const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: "My Own Cart App",
    //     home: ProductsScreen(),
    //   ),
    // );

    ///////Multiprovider Implementation

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => DataStore())),
        ChangeNotifierProvider(create: ((context) => Cart())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Own Cart App",
        home: ProductsScreen(),
      ),
    );
  }
}
