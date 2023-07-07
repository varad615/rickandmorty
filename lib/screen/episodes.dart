import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Episodes extends StatefulWidget {
  const Episodes({super.key});

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
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
        final airdate = user['air_date'];

        final episode = user['episode'];
        final name = user['name'];
        return ListTile(
            title: Text(name.toString()),
            subtitle: Text(airdate),
            trailing: Text(episode));
      },
    ));
  }

  void fetchUsers() async {
    print("Fetching Episodes");
    const url = "https://rickandmortyapi.com/api/episode";
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final body = res.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('Episodes Fetched');
  }
}
