import 'dart:math';

import 'package:flutter/material.dart';
import 'package:listview_batch30/view/data_table_view.dart';
import 'package:listview_batch30/view/profile_view.dart';
import 'package:listview_batch30/view/settings.dart';
import 'package:listview_batch30/view/student_view.dart';

import 'home_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [
    const HomeView(),
    const StudentView(),
    const SettingsView(),
    const ProfileView(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.lightGreen,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: Icon(
                Icons.library_books,
                color: _selectedIndex == 1 ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              icon: Icon(
                Icons.settings,
                color: _selectedIndex == 2 ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.amber,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.black,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_bag), label: 'Cart'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.adobe_outlined), label: 'About Us'),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
