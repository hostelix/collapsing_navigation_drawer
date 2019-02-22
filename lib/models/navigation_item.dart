import 'package:flutter/material.dart';

class NavigationItem {
  String title;
  IconData icon;

  NavigationItem({this.title, this.icon});
}

List<NavigationItem> navigationItems = [
  NavigationItem(title: "Dashboard", icon: Icons.dashboard),
  NavigationItem(title: "Errors", icon: Icons.error),
  NavigationItem(title: "Search", icon: Icons.search),
  NavigationItem(title: "Notifications", icon: Icons.notifications),
  NavigationItem(title: "Settings", icon: Icons.settings),
];
