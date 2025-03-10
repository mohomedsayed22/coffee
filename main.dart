import 'package:flutter/material.dart';
import 'package:task2_minders_buycoffee/home_screen.dart';

void main() {
  runApp( MyApp ());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomeScreen(),
    );
  }
}