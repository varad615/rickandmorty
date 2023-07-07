import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Character extends StatefulWidget {
  const Character({super.key});

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
        final status = user['status'];
        final name = user['name'];
        return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(character),
            ),
            title: Text(name.toString()),
            subtitle: Text(gender),
            trailing: ActionChip(
                avatar: const Icon(Icons.favorite, color: Colors.red),
                label: Text(
                  status,
                  style: const TextStyle(color: Colors.red),
                )));
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
