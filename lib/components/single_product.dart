import 'package:cartapp/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class SingleProduct extends StatelessWidget {
  final int? id;
  final String? name;
  final String? delails;
  final int? price;
  final String? imageUrl;
  const SingleProduct(
      {Key? key,
      required this.id,
      required this.name,
      required this.delails,
      required this.price,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      width: 200,
      height: 300,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("../../images/products/$imageUrl"),
            width: 200,
            height: 180,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "$name",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("$delails",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    )),
                Text("Price: $price Tk/Kg",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      // var cartIcon = context.read<DataStore>();
                      // cartIcon.add();
                      // codes for shopping cart
                      var cartBox = context.read<Cart>();
                      cartBox.addItem(
                          productId: "$id",
                          price: price!.toDouble(),
                          title: "$name",
                          subTitle: "$delails");
                    },
                    child: const Text("Add to Cart")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
