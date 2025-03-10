import 'package:flutter/material.dart';

import 'CoffeeDetailScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> coffeeList = [
    {"name": "Caffe Mocha", "price": "4.53", "image": "assets/1.jpeg"},
    {"name": "Flat White", "price": "3.53", "image": "assets/2.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Coffee Shop"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Buy one get one FREE", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoffeeDetailScreen(coffee: coffeeList[index]),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(coffeeList[index]['image'], height: 160, ),
                          SizedBox(height: 8),
                          Text(coffeeList[index]['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("\$${coffeeList[index]['price']}", style: TextStyle(fontSize: 14, color: Colors.brown)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
