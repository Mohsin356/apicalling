import 'package:apicalling/models/post.dart';
import 'package:flutter/material.dart';
import 'package:apicalling/repo.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
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
        body: Center(
            child: FutureBuilder<List<Post>>(
              future: Repo.fetchAlbum(),
              builder: (
                  BuildContext context,
                  AsyncSnapshot snapshot,
                  ) {
                // print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                  return ListView.builder(itemCount:snapshot.data!.length,itemBuilder: (context, index) {
                     Post post = snapshot.data![index];
                    return Text(post.body!);
                  });
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            )
        ),
      ),
    );
  }

}