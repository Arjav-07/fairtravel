import 'package:flutter/material.dart';
import 'package:fair_travel/pages/nav_pages/home_page.dart';
import 'package:fair_travel/pages/nav_pages/bar_item_page.dart';
import 'package:fair_travel/pages/nav_pages/search_page.dart';
import 'package:fair_travel/pages/nav_pages/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  final List<IconData> icons = [
    Icons.apps,
    Icons.bar_chart,
    Icons.search,
    Icons.person,
  ];

  final List<String> labels = ["Home", "Popular", "Search", "Profile"];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],

      /* --------------------Rounded, elevated, smooth BOTTOM NAVIGATION--------------------*/
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 25,
                spreadRadius: 1,
                offset: const Offset(0, 5), // bottom
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 25,
                spreadRadius: 1,
                offset: const Offset(0, -5), // top
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(-5, 0), // left
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 0), // right
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(icons.length, (index) {
                  final bool isSelected = index == currentIndex;

                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.grey[800]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Row(
                          children: [
                            Icon(
                              icons[index],
                              color: isSelected ? Colors.white : Colors.grey,
                              size: 24,
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: isSelected
                                  ? Padding(
                                      key: ValueKey(index),
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        labels[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),

      /*-------------------------------------------------------------------------------- */
    );
  }
}
