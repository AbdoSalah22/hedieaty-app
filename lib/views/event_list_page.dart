import 'package:flutter/material.dart';

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  // Sample list of events
  List<Map<String, String>> events = [
    {"name": "Birthday Party", "category": "Celebration", "status": "Upcoming"},
    {"name": "Graduation", "category": "Academic", "status": "Current"},
    {"name": "Anniversary", "category": "Celebration", "status": "Past"},
  ];

  String sortBy = 'name'; // Default sorting option

  void _sortEvents(String criteria) {
    setState(() {
      sortBy = criteria;
      events.sort((a, b) => a[criteria]!.compareTo(b[criteria]!));
    });
  }

  void _addEvent() {
    // Add event logic here
  }

  void _editEvent(int index) {
    // Edit event logic here
  }

  void _deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sorting options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Events',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                PopupMenuButton<String>(
                  onSelected: _sortEvents,
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'name', child: Text('Sort by Name')),
                    PopupMenuItem(value: 'category', child: Text('Sort by Category')),
                    PopupMenuItem(value: 'status', child: Text('Sort by Status')),
                  ],
                  child: Icon(Icons.sort),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Event list
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(events[index]["name"]!),
                      subtitle: Text("Category: ${events[index]["category"]} - Status: ${events[index]["status"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editEvent(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteEvent(index),
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
        onPressed: _addEvent,
        child: Icon(Icons.add),
        tooltip: 'Add Event',
      ),
    );
  }
}
