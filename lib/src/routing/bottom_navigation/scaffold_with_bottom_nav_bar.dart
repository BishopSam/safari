import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/src/constants/app_colors.dart';
import 'package:travel_app/src/routing/bottom_navigation/nav_bar_item.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({super.key, required this.child});
  final Widget child;
  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  static const tabs = [
    ScaffoldWithBottomNavBarItem(
      icon: Icon(Icons.home_rounded),
      label: '',
      initialLocation: '/home',
    ),
    ScaffoldWithBottomNavBarItem(
        icon: Icon(Icons.explore), initialLocation: '/explore', label: ''),
    ScaffoldWithBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        initialLocation: '/bookings',
        label: ''),
    ScaffoldWithBottomNavBarItem(
        icon: Icon(Icons.person), initialLocation: '/profile', label: ''),
  ];

  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kUnselectedBottomNavBarColor,
          backgroundColor: Colors.white,
          items: tabs,
          currentIndex: _currentIndex,
          onTap: (tabIndex) => _onItemTapped(context, tabIndex),
        ),
      ),
    );
  }
}
