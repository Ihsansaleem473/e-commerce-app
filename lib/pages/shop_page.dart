import 'package:e_commerce_app/components/My_drawer.dart';
import 'package:e_commerce_app/components/my_product_tile.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key  });

  @override
  Widget build(BuildContext context) {
    // access product in shopp
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Shop page"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // go to cart button
           IconButton(onPressed: (() {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  CartPage()),
  );
           }), icon: Icon(Icons.shopping_cart_outlined),)
          ],
        ),
        drawer: const mydrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            // shop title

            Center(
              child: Text(
                "Pick from a selected list of premium products",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            // shop subtitle

            //product list

            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final Product = products[index];
                  return MyProductTile(product:Product );
                },
              ),
            ),
          ],
        ));
  }
}
