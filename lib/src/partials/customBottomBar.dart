import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(BuildContext pageContext, int index) {
    final routers = ['/home', '/continent', '/search'];
    final routerRedirect = routers[index];
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(pageContext, routerRedirect);
  }

  static final List<BottomNavigationBarItem> _widgetOptions =
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

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (currentIndex) {
          _onItemTapped(context, currentIndex);
        },
        items: _widgetOptions);
  }
}

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

//   void _onItemTapped(BuildContext pageContext, int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     Navigator.pushNamed(pageContext, '/home');
//   }

//   static final List<BottomNavigationBarItem> _widgetOptions =
//       <BottomNavigationBarItem>[
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: 'Home',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.public),
//       label: 'Escolher continente',
//     ),
//     const BottomNavigationBarItem(
//       icon: Icon(Icons.search),
//       label: 'Buscar cidade',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: _widgetOptions,
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.teal,
//       onTap: _onItemTapped,
//     );
//   }
// }

//   // return BottomNavigationBar(
//   //   currentIndex: _selectedIndex,
//   //   selectedItemColor: Colors.amber[800],
//   //   onTap: _onItemTapped,
//   //   items: const <BottomNavigationBarItem>[
//   //     BottomNavigationBarItem(
//   //       icon: Icon(Icons.home),
//   //       label: 'Home',
//   //     ),
//   //     BottomNavigationBarItem(
//   //       icon: Icon(Icons.business),
//   //       label: 'Business',
//   //     ),
//   //     BottomNavigationBarItem(
//   //       icon: Icon(Icons.school),
//   //       label: 'School',
//   //     ),
//   //   ],
//   // );

