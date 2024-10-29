import 'package:flutter/material.dart';

class GiftListPage extends StatefulWidget {
  @override
  _GiftListPageState createState() => _GiftListPageState();
}

class _GiftListPageState extends State<GiftListPage> {
  // Sample list of gifts with image URLs
  List<Map<String, String>> gifts = [
    {
      "name": "Watch",
      "category": "Accessories",
      "status": "Bought",
      "imageUrl": "https://example.com/watch.jpg"
    },
    {
      "name": "Book",
      "category": "Education",
      "status": "Pending",
      "imageUrl": "https://example.com/book.jpg"
    },
    {
      "name": "Headphones",
      "category": "Electronics",
      "status": "Pending",
      "imageUrl": "https://example.com/headphones.jpg"
    },
  ];

  void _addGift() {
    // Logic to add a gift
  }

  void _editGift(int index) {
    // Logic to edit a gift
  }

  void _deleteGift(int index) {
    setState(() {
      gifts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gift List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and header
            Text(
              'Gifts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Gift list
            Expanded(
              child: ListView.builder(
                itemCount: gifts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      // Gift Image
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(gifts[index]["imageUrl"]!),
                        radius: 25,
                      ),
                      title: Text(gifts[index]["name"]!),
                      subtitle: Text("Category: ${gifts[index]["category"]} - Status: ${gifts[index]["status"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editGift(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteGift(index),
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addGift,
        child: Icon(Icons.add),
        tooltip: 'Add Gift',
      ),
    );
  }
}
