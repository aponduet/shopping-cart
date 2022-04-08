import 'package:cartapp/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class SingleCartitem extends StatelessWidget {
  final String? id;
  final int? quantity;
  final String? name;
  final String? details;
  final int price;
  final String? imageUrl;
  const SingleCartitem(
      {Key? key,
      required this.id,
      required this.name,
      required this.details,
      required this.price,
      required this.imageUrl,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      width: 200,
      height: 350,
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
                Text("$details",
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
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<Cart>().addItem(
                                productId: "$id",
                                price: price.toDouble(),
                                title: "$name",
                                subTitle: "$details",
                                imageUrl: "$imageUrl");
                          },
                          icon: const Icon(Icons.add_outlined)),
                      Text("$quantity"),
                      IconButton(
                          onPressed: () {
                            context.read<Cart>().removeSingleItem("$id");
                          },
                          icon: const Icon(Icons.remove_outlined)),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      var removeItem = context.read<Cart>();
                      removeItem.removeItem("$id");
                    },
                    child: const Text("Delete")),

                // Test of Consuming
              ],
            ),
          )
        ],
      ),
    );
  }
}
