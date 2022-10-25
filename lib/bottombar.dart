import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Back',
      style: optionStyle,
    ),
    Text(
      'Index 1: home',
      style: optionStyle,
    ),
    Text(
      'Index 2: call',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          // only scroll to top when current index is selected.
          if (_selectedIndex == index) {
            Navigator.pop(context);
          }
          break;
        case 1:
          if (_selectedIndex == index) {
            Navigator.pushReplacementNamed(context, '/menu');
          }
          break;
        case 2:

          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 40,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: ''),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue[900],
      unselectedItemColor: Colors.grey[600],
      onTap: _onItemTapped,
    );
  }
}
