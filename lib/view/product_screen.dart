// All Product Screen Gellary

import 'package:cartapp/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/single_product.dart';
import '../models/product_model.dart';
import 'cart_screen.dart';

// Hard Coded Data

List<ProductInfo> dataList = [
  ProductInfo(
      id: 145,
      name: "Apple",
      details: "Apple is very nutrious fruits.",
      price: 120,
      imageUrl: "1.jpg"),
  ProductInfo(
      id: 256,
      name: "Banana",
      details: "Apple is very nutrious fruits.",
      price: 56,
      imageUrl: "2.jpg"),
  ProductInfo(
      id: 89,
      name: "Orange",
      details: "Apple is very nutrious fruits.",
      price: 984,
      imageUrl: "3.jpg"),
  ProductInfo(
      id: 755,
      name: "Cucamber",
      details: "Apple is very nutrious fruits.",
      price: 782,
      imageUrl: "4.jpg"),
  ProductInfo(
      id: 965,
      name: "Grapse",
      details: "Apple is very nutrious fruits.",
      price: 315,
      imageUrl: "5.jpg"),
  ProductInfo(
      id: 146,
      name: "Pinute",
      details: "Apple is very nutrious fruits.",
      price: 761,
      imageUrl: "6.jpg"),
  ProductInfo(
      id: 365,
      name: "Pineaple",
      details: "Apple is very nutrious fruits.",
      price: 936,
      imageUrl: "7.jpg"),
];

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
                child: Consumer<Cart>(
                  builder: (context, data, child) {
                    return Text(
                      "Total: ${data.totalAmount}",
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
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: SizedBox(
            width: 500,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 200 / 300),
                itemCount: dataList.length,
                itemBuilder: (context, index) => SingleProduct(
                      id: dataList[index].id,
                      name: dataList[index].name,
                      delails: dataList[index].details,
                      price: dataList[index].price,
                      imageUrl: dataList[index].imageUrl,
                    )),
          )),
    );
  }
}


// Hard Coded Data