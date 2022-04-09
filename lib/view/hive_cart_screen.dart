import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../components/hive_cart_single_product.dart';
import '../models/cart_model.dart';

class HiveCartScreen extends StatefulWidget {
  const HiveCartScreen({Key? key}) : super(key: key);

  @override
  State<HiveCartScreen> createState() => _HiveCartScreenState();
}

class _HiveCartScreenState extends State<HiveCartScreen> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Connect to Local Storage
    box = Hive.box('cartBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive CART"),
        actions: [
          Center(
            // Make the totla ammount value Listenable
            child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box box, child) {
                  // Convert Box Data to Map Data
                  var cartinfo = box.toMap();

                  var total = 0.0;
                  cartinfo.forEach((key, cartItem) {
                    total += cartItem.price * cartItem.quantity;
                  });

                  return Text(
                    "Total : $total tk",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  );
                }),
          ),
          ElevatedButton(
            onPressed: (() {}),
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Container(
          width: 500,
          padding: const EdgeInsets.all(10),
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box box, widget) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text('Cart is Empty :('),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 200 / 350),
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      List<CartItem> cartdata = [];
                      // Convert Box Data to Map Data
                      var cartinfo = box.toMap();

                      // Convert Map Data to List Data

                      cartinfo.forEach((k, v) => cartdata.add(v));

                      return HiveSingleCartitem(
                        id: cartdata[index].id,
                        name: cartdata[index].title,
                        details: cartdata[index].subTitle,
                        price: cartdata[index].price.toInt(),
                        imageUrl: cartdata[index].imageUrl,
                        quantity: cartdata[index].quantity,
                      );
                    },
                  );
                }
              })),
    );
  }
}
