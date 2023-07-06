import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rickmorty/screen/character.dart';
import 'package:rickmorty/screen/location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [Character(), Location()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick & Morti"),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Character's",
                backgroundColor: Color(0xFF2CC350)),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: "Home",
                backgroundColor: Colors.red)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
