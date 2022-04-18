import 'dart:convert';

import 'models/post.dart';
import 'package:http/http.dart' as http;
class Repo{
   static String get baseUrl => "https://jsonplaceholder.typicode.com/" ;
static Future<Post> fetchAlbum() async {
    // final response = await http.get(
    //     Uri.parse('${baseUrl}posts/1'));
  var response = await getApi('posts/1');
    // Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    print(response.body);
    final _jasonData = jsonDecode(response.body);
    return Post.fromJson(_jasonData);
  }
   static Future<http.Response> getApi(String endpoint) async {
     final response = await http.get(
         Uri.parse('$baseUrl$endpoint'));
    return response;
   }

}