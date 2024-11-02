import 'package:flutter/material.dart';
import 'package:flutter_loginpage/LoginPage.dart'; // Make sure to import LoginPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Function to handle logout
  void _handleLogout(BuildContext context) {
    // You can add any logout logic here (clearing session, tokens etc.)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  // Added more detailed screen content
  final screens = [
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 80),
          SizedBox(height: 20),
          Text('Home Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.feed, size: 80),
          SizedBox(height: 20),
          Text('Feed Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.search, size: 80),
          SizedBox(height: 20),
          Text('Search Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.notifications, size: 80),
          SizedBox(height: 20),
          Text('Notifications Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.person, size: 80),
          SizedBox(height: 20),
          Text('Profile Page', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(  // Add this to prevent back button from going back to login page
      onWillPop: () async {
        return false;  // Prevents going back with system back button
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          automaticallyImplyLeading: false, // This will remove the back button
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _handleLogout(context),  // Updated logout handler
            ),
          ],
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}