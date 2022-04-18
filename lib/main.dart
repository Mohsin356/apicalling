import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apicalling/models/album.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var peoples;
  void fetchAlbum() async {
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
      Map<String, dynamic> serverData = jsonDecode(response.body);
      final jsonData= Album.fromJson(serverData);
      setState(() {
        peoples=jsonData;
      });
    }catch(err) {}
  }
  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body:

               Text('title:\n ${peoples.title}\n'),


      ),
    );
  }
}