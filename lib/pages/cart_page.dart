import 'package:e_commerce_app/components/my_button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/models/shop.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  // remove item from cart
  void removeItemFromCart(BuildContext context, Product producT) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from  your cart ?"),
        actions: [
          // cancal button

          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child:  Text("cancal "),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context );
               
              // add to cart
              context.read<Shop>().removeFromCart(producT);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  void PayButtonPressed (BuildContext context){

    showDialog(context: context, builder: (context)=> AlertDialog(
      content: Text("user wants to pay ! connect this app to your paymet  backend "),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: 
              // if cart is empty then set it 
              cart.isEmpty ? Center(child: Text("Your cart is empty ..")):
              
               ListView.builder(
                  itemCount: cart.length,
                  
                  itemBuilder: (context, index) {
                    final item = cart[index];
//return as list tile
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon:const Icon(Icons.remove),
                        onPressed: (() => removeItemFromCart(context, item)),
                        
                      ),
                    );
                  }),
                  ),
                  
                  // access to pay button 
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Mybutton(onTap: (() => PayButtonPressed(context)), child: Text("Pay Now"),),
                  )
        ],
      ),
    );
  }
}
