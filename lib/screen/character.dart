import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Character extends StatefulWidget {
  Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  // called the above function
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final gender = user['gender'];
        final character = user['image'];
        final name = user['name'];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(character),
          ),
          title: Text(name.toString()),
          subtitle: Text(gender),
        );
      },
    ));
  }

  void fetchUsers() async {
    print("Fetching Characters");
    const url = "https://rickandmortyapi.com/api/character";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('Character Fetched');
  }
}
