import 'package:cartapp/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class HiveSingleCartitem extends StatefulWidget {
  final String id;
  final String name;
  final String details;
  final int price;
  final String imageUrl;
  final int quantity;
  const HiveSingleCartitem({
    Key? key,
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  }) : super(key: key);

  @override
  State<HiveSingleCartitem> createState() => _HiveSingleCartitemState();
}

class _HiveSingleCartitemState extends State<HiveSingleCartitem> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Connect to Local Storage
    box = Hive.box('cartBox');
  }

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
            image: AssetImage("../../images/products/${widget.imageUrl}"),
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
                  widget.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(widget.details,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    )),
                Text("Price: ${widget.price} Tk/Kg",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 5,
                ),

                // Quantity Modifier Button Area
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            CartItem updatequantity = CartItem(
                                id: widget.id,
                                title: widget.name,
                                subTitle: widget.details,
                                quantity: widget.quantity + 1,
                                price: widget.price.toDouble(),
                                imageUrl: widget.imageUrl);

                            await box.put(widget.id, updatequantity);
                          },
                          icon: const Icon(Icons.add_outlined)),
                      Text("${widget.quantity}"),
                      IconButton(
                          onPressed: () async {
                            var key = widget.id;
                            if (!box.containsKey(key)) {
                              return;
                            }
                            if (widget.quantity > 1) {
                              CartItem updatequantity = CartItem(
                                  id: widget.id,
                                  title: widget.name,
                                  subTitle: widget.details,
                                  quantity: widget.quantity - 1,
                                  price: widget.price.toDouble(),
                                  imageUrl: widget.imageUrl);

                              await box.put(key, updatequantity);
                            } else {
                              await box.delete(widget.id);
                            }
                          },
                          icon: const Icon(Icons.remove_outlined)),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await box.delete(widget.id);
                    },
                    child: const Text("Delete")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
