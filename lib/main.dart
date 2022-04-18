import 'dart:convert';
import 'package:apicalling/repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/post.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var persons;
  // Future fetchAlbum() async {
  //   try {
  //     final response = await http.get(
  //         Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  //         // Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  //     print(response.body);
  //     final _jasonData = jsonDecode(response.body);
  //     var data = Post.fromJson(_jasonData);
  //
  //     print(_jasonData);
  //     setState((){
  //       persons=data;
  //     });
  //   }
  //   catch(err){}
  // }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchAlbum();
    // callApi();
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
        body:FutureBuilder(
          future: Repo.fetchAlbum(),
          builder: (context,projectSnap){

            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            }else{
              Post data=projectSnap.data as Post;
              return Text('${data.body}');
            }

          },
        )
          // Text("${persons?.body ?? "hi"}"),
          // ListView.builder(
          //     itemCount: persons.length,
          //     itemBuilder: (context, index) {
          //       final post= persons[index];
          //       return Text("Title:\n ${post["title"]}\n");
          // }),

      ),

    );
  }

  // void callApi() async{
  //   // Repo repo=Repo();
  //   // persons = await Repo.fetchAlbum();
  //   // setState(() {
  //   // });
  //   Repo.fetchAlbum().then((value){
  //     setState(() {
  //       print(value.runtimeType);
  //        persons= value;
  //     });
  //   });
  // }
}