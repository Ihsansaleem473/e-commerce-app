import 'package:e_commerce_app/components/my_list_tile.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/intro_page.dart';
import 'package:flutter/material.dart';

 class  mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
        children: [
          Column(
            children: [
                 //drawer header
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

// shop tile
           MyListTile(
            icon: Icons.home,
            text: "shop",
            onTap: () { Navigator.pop(context);},
          ),
            MyListTile(
            icon: Icons.shopping_cart,
            text: "cart",
            onTap: () {
              Navigator.pop(context);
              // go cart page
            //  Navigator.pushNamed(context, "CartPage()");
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  CartPage()));
   },

            
          ),
           
            ],
            
          ),
           Padding(
             padding: const EdgeInsets.only(bottom:25, ),
             child: MyListTile(
              icon: Icons.logout,
              text: "exit",
              onTap: () {
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const intropage()));
              },
          ),
           ),
       
        ],
      ),
    );
  }
}
