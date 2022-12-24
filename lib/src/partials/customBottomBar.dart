import 'package:flutter/material.dart';

Widget CustomBottomNavigationBar({
  required BuildContext pageContext,
  int selectedIndex = 0,
}) {
  void _onItemTapped(BuildContext pageContext, int index) {
    final routers = ['/home', '/continent', '/search'];
    final routerRedirect = routers[index];

    Navigator.pushNamed(pageContext, routerRedirect);
  }

  final List<BottomNavigationBarItem> _widgetOptions =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: 'Escolher continente',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Buscar cidade',
    ),
  ];

  return BottomNavigationBar(
    currentIndex: selectedIndex,
    selectedItemColor: Colors.teal,
    onTap: (currentIndex) {
      _onItemTapped(pageContext, currentIndex);
    },
    items: _widgetOptions,
  );
}
