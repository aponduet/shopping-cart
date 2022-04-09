import 'package:cartapp/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class SingleProduct extends StatefulWidget {
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
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
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
                  "${widget.name}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("${widget.delails}",
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
                ElevatedButton(
                    onPressed: () {}, child: const Text("View Item")),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var productId = widget.id.toString();
                      //Codes for Hive Store

                      if (box.containsKey(productId)) {
                        var existingCartItem = box.get(productId);
                        //change quantity
                        CartItem updateData = CartItem(
                            id: existingCartItem.id,
                            title: existingCartItem.title,
                            subTitle: existingCartItem.subTitle,
                            quantity: existingCartItem.quantity + 1,
                            price: existingCartItem.price,
                            imageUrl: existingCartItem.imageUrl);

                        box.put(productId, updateData);
                        print('Hello!! Info updated in box!');
                      } else {
                        CartItem boxData = CartItem(
                            id: widget.id.toString(),
                            title: "${widget.name}",
                            subTitle: "${widget.delails}",
                            quantity: 1,
                            price: widget.price!.toDouble(),
                            imageUrl: '${widget.imageUrl}');

                        box.put(productId, boxData);
                        print('Hello!! Product added in box!');
                      }

                      // codes for shopping cart
                      var cartBox = context.read<Cart>();
                      cartBox.addItem(
                          productId: "${widget.id}",
                          price: widget.price!.toDouble(),
                          title: "${widget.name}",
                          subTitle: "${widget.delails}",
                          imageUrl: '${widget.imageUrl}');
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
