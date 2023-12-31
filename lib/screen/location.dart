import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
        final type = user['type'];
        final name = user['name'];
        return ListTile(
          // leading: ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child: Image.network(character),
          // ),
          title: Text(name.toString()),
          subtitle: Text(type),
        );
      },
    ));
  }

  void fetchUsers() async {
    print("Location Characters");
    const url = "https://rickandmortyapi.com/api/location";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('Location Fetched');
  }
}
