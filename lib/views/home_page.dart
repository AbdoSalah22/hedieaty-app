import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String username = "Abdelrahman";
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<Friend> filteredFriends = friendsList;

  void _filterFriends(String query) {
    final results = friendsList
        .where((friend) => friend.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredFriends = results;
    });
  }

  void _showCreateEventDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController titleController = TextEditingController();
        final TextEditingController dateController = TextEditingController();

        return AlertDialog(
          title: Text('Create Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Event Title'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Event Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to save the event
                final title = titleController.text;
                final date = dateController.text;

                if (title.isNotEmpty && date.isNotEmpty) {
                  // Add event to event list or database
                  print('Event Created: $title on $date');
                }
                Navigator.pop(context);
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _showAddFriendDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController friendNameController = TextEditingController();

        return AlertDialog(
          title: Text('Add Friend'),
          content: TextField(
            controller: friendNameController,
            decoration: InputDecoration(labelText: 'Friend Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final friendName = friendNameController.text;
                if (friendName.isNotEmpty) {
                  setState(() {
                    friendsList.add(Friend(
                      name: friendName,
                      imageUrl: 'https://picsum.photos/200', // Placeholder
                      events: 0,
                    ));
                    filteredFriends = friendsList;
                  });
                  print('Friend Added: $friendName');
                }
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi, ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF485954),
                      ),
                    ),
                    TextSpan(
                      text: username,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF35403E),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[800],
                  ),
                  onPressed: _showCreateEventDialog,
                  child: Text(
                    'Create Your Own Event',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Friends',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF35403E),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 32,
                        onPressed: _showAddFriendDialog,
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 28,
                        onPressed: () {
                          setState(() {
                            _isSearching = !_isSearching;
                            if (!_isSearching) {
                              filteredFriends = friendsList;
                              _searchController.clear();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              if (_isSearching)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: TextField(
                    controller: _searchController,
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      hintText: 'Search friends...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.teal,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onChanged: _filterFriends,
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredFriends.length,
                  itemBuilder: (context, index) {
                    return FriendCard(friend: filteredFriends[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Friend {
  final String name;
  final String imageUrl;
  final int events;

  Friend({required this.name, required this.imageUrl, required this.events});
}

final List<Friend> friendsList = [
  Friend(name: 'Alice', imageUrl: 'https://picsum.photos/id/1/200/200', events: 2),
  Friend(name: 'Bob', imageUrl: 'https://picsum.photos/id/2/200/200', events: 1),
  Friend(name: 'Charlie', imageUrl: 'https://picsum.photos/id/3/200/200', events: 0),
  Friend(name: 'Darwin', imageUrl: 'https://picsum.photos/id/4/200/200', events: 0),
];

class FriendCard extends StatelessWidget {
  final Friend friend;

  FriendCard({required this.friend});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(friend.imageUrl),
        ),
        title: Text(
          friend.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          friend.events > 0
              ? 'Upcoming Events: ${friend.events}'
              : 'No Upcoming Events',
        ),
      ),
    );
  }
}
