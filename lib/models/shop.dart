import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier{
  //list of product
  final List<Product> _Shop = [
   //product 1
    Product(
      "product 1",
      
      99.99,
      "item description ", 
     " assets/- watch.jpg"
    ),
     //product 2
    Product(
      "product 2",
      99.99,
      "description 1",
       'assets/- hoodie.png'
    ),
     //product 3
    Product(
      "product 3",
      99.99,
      "description 1" ,
       " assets/- men-shoes.png"


    ),
     //product 4
    Product(
      "product 4",
      99.99,
      "description 1",
       " assets/-glasses.jpg"
    ),
    
  ];

  //list of user cart

  List <Product> _cart = [];

  // get product list
List <Product> get shop =>_Shop;

  //get user  cart
  List<Product> get cart => _cart;


  //Ass item to cart
  void  addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

//remove item from cart
void removeFromCart(Product item){
  _cart.remove(item);
  notifyListeners();
} 
}
