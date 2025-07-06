import 'package:fair_travel/pages/nav_pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fair_travel/pages/nav_pages/bar_item_page.dart';
import 'package:fair_travel/pages/nav_pages/search_page.dart';
import 'package:fair_travel/pages/nav_pages/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0; //

  final List<Widget> pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Bar", icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "My Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
