import 'package:e_commerce_app/models/shop.dart';
import 'package:e_commerce_app/pages/intro_page.dart';
import 'package:e_commerce_app/themes/light_mood.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider( 
      create: (context) => Shop(),
      child:const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: intropage(),
      debugShowCheckedModeBanner: false,
      theme: lightMood,

      //  themeMode: ThemeMode.light,
    );
  }
}
 