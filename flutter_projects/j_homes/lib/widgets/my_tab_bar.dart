import 'package:flutter/material.dart';
import 'package:j_homes/screens/favourite_page.dart';
import 'package:j_homes/screens/home_page.dart';
import 'package:j_homes/screens/profile_page.dart';
import 'package:j_homes/screens/search_page.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool _isExpanded = false;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () => setState(() => _isExpanded = !_isExpanded),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          HomePage(),
                          FavoritesPage(),
                          SearchPage(),
                          ProfilePage(),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   height: 20,

                    //   top: 400,
                    //   child: IconButton(
                    //     icon: Icon(
                    //       _isExpanded
                    //           ? Icons.arrow_back_ios
                    //           : Icons.arrow_forward_ios,

                    //       color: Colors.black,
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         _isExpanded = !_isExpanded;
                    //       });
                    //     },
                    //   ),
                    // ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      left: _isExpanded ? 12 : -100,
                      top: 300,
                      child: Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 6.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildVerticalTab(0, Icons.home, "Home"),
                              const SizedBox(height: 12),
                              _buildVerticalTab(1, Icons.favorite, "Favourite"),
                              const SizedBox(height: 12),
                              _buildVerticalTab(2, Icons.search, "Search"),
                              const SizedBox(height: 12),
                              _buildVerticalTab(3, Icons.person, "Profile"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalTab(int index, IconData icon, String label) {
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, child) {
        final bool isSelected = tabController.index == index;
        return InkWell(
          onTap: () {
            tabController.animateTo(index);
            setState(() => _isExpanded = false);
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            decoration: BoxDecoration(
              color: isSelected ? Colors.indigo.shade50 : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: Colors.blue.shade500, width: 1.5)
                  : Border.all(color: Colors.transparent),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.blue.shade500 : Colors.grey,
                  size: 26,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? Colors.blue.shade500 : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
