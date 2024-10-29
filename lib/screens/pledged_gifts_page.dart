import 'package:flutter/material.dart';

class PledgedGiftsPage extends StatelessWidget {
  final List<Gift> pledgedGifts = [
    Gift(
      title: 'Gift 1',
      imageUrl: 'https://example.com/gift1.jpg',
      price: 50.0,
      category: 'Toys',
      availability: 'Pledged',
    ),
    Gift(
      title: 'Gift 2',
      imageUrl: 'https://example.com/gift2.jpg',
      price: 30.0,
      category: 'Books',
      availability: 'Pledged',
    ),
    // Add more gifts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pledged Gifts'),
      ),
      body: ListView.builder(
        itemCount: pledgedGifts.length,
        itemBuilder: (context, index) {
          final gift = pledgedGifts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gift title
                  Text(
                    gift.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Gift image
                  Image.network(gift.imageUrl),
                  SizedBox(height: 8),
                  // Gift details
                  Text('Price: \$${gift.price.toStringAsFixed(2)}'),
                  Text('Category: ${gift.category}'),
                  Text('Availability: ${gift.availability}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Gift class to represent each gift
class Gift {
  final String title;
  final String imageUrl;
  final double price;
  final String category;
  final String availability;

  Gift({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.availability,
  });
}
