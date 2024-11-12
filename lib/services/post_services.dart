import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Post.dart';

class PostService{
  Future<List<Post>?> getPosts() async{
    var client = http.Client();

    // uri parse form url
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // getting response
    var response = await client.get(uri);

    // checking status code is 200 or not to ensure we've got response
    if(response.statusCode == 200){
      var json = response.body;
      return jsonDecode(json);
    }
  }
}