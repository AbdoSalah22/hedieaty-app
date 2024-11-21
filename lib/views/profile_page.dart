import 'package:flutter/material.dart';
import 'package:hedieaty/views/pledged_gifts_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'Your Name'; // Default name
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = userName; // Set initial value of the text field
  }

  void _updateName() {
    setState(() {
      userName = _nameController.text; // Update the displayed name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User photo
            Center(
              child: CircleAvatar(
                radius: 60, // Circle size
                backgroundImage: NetworkImage('https://example.com/user_photo.jpg'), // Replace with the user's photo URL
              ),
            ),
            SizedBox(height: 20),
            // Editable name with edit button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      _updateName(); // Update name when submitted
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _updateName(); // Update name when the pen icon is pressed
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Pledged gifts button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Increase padding for a bigger button
                ),
                onPressed: () {
                  // Navigate to pledged gifts page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PledgedGiftsPage()),
                  );
                },
                child: Text('View Pledged Gifts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// // Placeholder for Pledged Gifts Page
// class PledgedGiftsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pledged Gifts'),
//       ),
//       body: Center(
//         child: Text('List of pledged gifts will be shown here.'),
//       ),
//     );
//   }
// }
