import 'package:flutter/material.dart';

class TopDrinksCard extends StatelessWidget {
  final Map<String, int> topDrinks;
  final int totalOrders;

  const TopDrinksCard({
    super.key,
    required this.topDrinks,
    required this.totalOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[50],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Selling Drinks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...topDrinks.entries.map((entry) {
              double widthFactor = totalOrders > 0
                  ? entry.value / totalOrders
                  : 0;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${entry.key} (${entry.value})'),
                    const SizedBox(height: 4),
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: widthFactor,
                          child: Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
