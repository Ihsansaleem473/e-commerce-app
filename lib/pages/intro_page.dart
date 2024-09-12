

import 'package:e_commerce_app/components/my_button.dart';
import 'package:e_commerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class intropage extends StatelessWidget {
  const intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 24,
            ),

            // text
            const Text(
              "Kojha brand ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),

            // subtitles
            Text(
              "Premium Quailty products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(
              height: 25,
            ),

            // // button
            Mybutton(
              onTap: (() {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShopPage()),
  );
              }),
              child: Icon(Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
