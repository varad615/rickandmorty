import 'package:flutter/material.dart';
import 'package:rickmorty/screen/character.dart';
import 'package:rickmorty/screen/episodes.dart';
import 'package:rickmorty/screen/location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [const Character(), const Location(), const Episodes()];


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
                icon: Icon(Icons.groups),
                label: "Characters",
                backgroundColor: Color(0xFF2CC350)),
            BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: "Locations",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: "Episodes",
                backgroundColor: Colors.blue)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
