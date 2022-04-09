import 'package:cartapp/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart';
import 'package:cartapp/models/cart_model.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(CartItemAdapter());

  // Open the peopleBox
  await Hive.openBox('cartBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
