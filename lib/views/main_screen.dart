import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'event_list_page.dart';
import 'profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages to display in the bottom navigation
  final List<Widget> _pages = [
    HomeScreen(),
    EventListPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event, size: 32,),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 32,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
