

import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  // ADD to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to cnfrm user to add cart
    showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
        content: const Text("add this item to your cart ?"),
        actions: [
          // cancal button 

          MaterialButton(
            onPressed: ()=> Navigator.pop(context),
            child: const Text("cancal "),
          ),

          // yes button 
           MaterialButton(
           onPressed: () {
             Navigator.pop(context);
             // add to cart 
             context.read<Shop>().addToCart(product);
           },
            child: const Text("Yes"),
          )
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                 
               child:Image.asset("assets/hoodie.png"),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //product name

              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //product descrition

              Text(
                "item description\n ... more description to describe the product more info here will look like  this ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          // product  price+add to cart
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // add to cart
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: (() {
                    addToCart(context);
                  }),
                  icon: (Icon(Icons.add)),
                ),
              ),

              Text(
                '\$${product.price.toStringAsFixed(2)}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
