import 'package:flutter/material.dart';
import 'package:news_app/view/bookmark_screen/bookmark_screen.dart';

import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:news_app/view/search_screen/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List<Widget> children = [
    HomeScreen(),
    SearchScreen(),
    BookmarkScreen(),
  ];
  void onTapped(int index) {
    if (index == 2) ;

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        iconSize: 22,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: onTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 25,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                size: 25,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                size: 25,
              ),
              label: "Saved"),
        ],
      ),
      body: children[currentIndex],
    );
  }
}