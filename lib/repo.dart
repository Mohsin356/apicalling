import 'dart:convert';
import 'models/post.dart';
import 'package:http/http.dart' as http;
class Repo{

   static String get baseUrl => "https://jsonplaceholder.typicode.com/" ;
static Future<List<Post>> fetchAlbum() async {
  var response = await getApi('posts');
    // print(response.body);
    final _jasonData = jsonDecode(response.body);
        // print("..$_jasonData");
  var postList=<Post>[];
    for(Map i in _jasonData ){
      var data = Post.fromJson(i as Map<String, dynamic>);
      postList.add(data);
    }
  // print(">>>>$postList");
    return postList;
  }
   static Future<http.Response> getApi(String endpoint) async {
     final response = await http.get(
         Uri.parse('$baseUrl$endpoint'));
    return response;
   }

}