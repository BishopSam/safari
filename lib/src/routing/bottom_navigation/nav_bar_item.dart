import 'package:flutter/cupertino.dart';

class ScaffoldWithBottomNavBarItem extends BottomNavigationBarItem {
  const ScaffoldWithBottomNavBarItem({required super.icon, required this.initialLocation, required super.label});
  final String initialLocation;
}
