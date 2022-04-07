// All Product Screen Gellary

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UNISHOP"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: 20,
                // height: 20,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Consumer<DataStore>(
                  builder: (context, data, child) {
                    return Text(
                      "Total: ${data.price}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const CartScreen())));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  var cart = context.read<DataStore>();
                  cart.add();
                },
                child: const Text("Add to Cart 10tk"))
          ],
        ),
      ),
    );
  }
}
