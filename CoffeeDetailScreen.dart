import 'package:flutter/material.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> coffee;
  final ValueNotifier<String> selectedSize = ValueNotifier<String>("M"); // State management

  CoffeeDetailScreen({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(coffee['image'], height: 150)),
            SizedBox(height: 16),
            Text(coffee['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text("4.8 (230 reviews)", style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 8),
            Text("A cappuccino is approximately 150 ml (5 oz) with espresso and fresh milk.",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 16),

            // Choice Chips with ValueNotifier
            Center(
              child: ValueListenableBuilder<String>(
                valueListenable: selectedSize,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ["S", "M", "L"].map((size) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ChoiceChip(
                          label: Text(size),
                          selected: value == size,
                          onSelected: (bool selected) {
                            if (selected) {
                              selectedSize.value = size; // Update state
                            }
                          },
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
