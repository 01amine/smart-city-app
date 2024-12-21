import 'package:bsc/features/chat_bot/presentation/chat_screen.dart';
import 'package:bsc/features/home/presentation/home_page.dart';
import 'package:bsc/features/map/presentation/map_screen.dart';
import 'package:bsc/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    MapScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Render the screen based on the index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xff495CF5), // Active color
        unselectedItemColor: Colors.grey, // Inactive color
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              color: _currentIndex == 0 ? const Color(0xff495CF5) : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/explore.png',
              color: _currentIndex == 1 ? const Color(0xff495CF5) : Colors.grey,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/fav.png',
              color: _currentIndex == 2 ? const Color(0xff495CF5) : Colors.grey,
            ),
            label: "Planner",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/profile.png',
              color: _currentIndex == 3 ? const Color(0xff495CF5) : Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
