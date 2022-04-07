import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartapp/view/product_screen.dart';
import 'models/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataStore(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Own Cart App",
        home: ProductsScreen(),
      ),
    );
  }
}
