import 'dart:ui';

import 'package:flutter/material.dart';

import './MentorFindPage.dart';
import './MenteeFindPage.dart';
import '../Widgets/ProfileWidget.dart';
import './SettingsScreen.dart';
import '../Widgets/ChatListWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _views = <Widget>[
    ProfileWidget(),
    MentorsFindPage(),
    MenteeFindPage(),
    ChatListWidget(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        },
        elevation: 0,
        mini: true,
        child: Icon(Icons.menu),
      ),
      body: Container( // gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFBE7C6), Color(0xFFCDFADB), Color(0xFF1D6260)],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            decoration: BoxDecoration(
              color: Color(0x99EDF9F8),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
              ),
            ),
            child: _views.elementAt(_selectedIndex), //shows widget according to bottomnavbar
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        iconSize: 35,
        selectedItemColor: Color(0xFFA0E7E5),
        unselectedItemColor: Color(0xFFC4C4C4),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Find a Mentor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Find a Mentee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
