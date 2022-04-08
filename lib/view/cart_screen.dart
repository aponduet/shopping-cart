import 'package:cartapp/components/cart_single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CART SCREEN"),
        actions: [
          Center(
            child: Consumer<Cart>(builder: (context, value, child) {
              return Text(
                "Total : ${value.totalAmount} tk",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              );
            }),
          ),
          ElevatedButton(
            onPressed: (() {}),
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      // body: SizedBox(
      //   height: double.infinity,
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Consumer<DataStore>(
      //         builder: (context, data, child) {
      //           return Text("Total Price : ${data.price}");
      //         },
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             var cart = context.read<DataStore>();
      //             cart.substract();
      //           },
      //           child: const Text("Delete"))
      //     ],
      //   ),
      // ),

      body: Container(
          width: 500,
          padding: const EdgeInsets.all(10),
          child: Consumer<Cart>(
            builder: (context, cartItems, child) {
              List<CartItem> cartdata = [];
              cartItems.items.forEach((k, v) => cartdata.add(v));

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 200 / 350),
                itemCount: cartdata.length,
                itemBuilder: (context, index) {
                  return SingleCartitem(
                    id: cartdata[index].id,
                    name: cartdata[index].title,
                    details: cartdata[index].subTitle,
                    price: cartdata[index].price.toInt(),
                    imageUrl: cartdata[index].imageUrl,
                    quantity: cartdata[index].quantity,
                  );
                },
              );
            },
          )),
    );
  }
}
