import 'package:flutter/material.dart';

class GiftDetailsPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final bool isPledged;

  const GiftDetailsPage({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.isPledged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gift Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gift title
            Text(
              name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Gift image
            Center(
              child: Image.network(
                imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Gift price
            Text(
              "Price: \$${price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            // Gift category
            Text(
              "Category: $category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 8),
            // Availability (pledged status)
            Text(
              "Availability: ${isPledged ? "Pledged" : "Not Pledged"}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: isPledged ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
