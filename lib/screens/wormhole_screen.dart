import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WormholeScreen extends StatefulWidget {
  const WormholeScreen({super.key});

  @override
  State<WormholeScreen> createState() => _WormholeScreenState();
}

class _WormholeScreenState extends State<WormholeScreen> {

  List<dynamic> posts = [];
  fetchData() async{
    final baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(baseUrl);

    if(response.statusCode == 200){
      print('success');
      // print(response.body);

      final jsonData = jsonDecode(response.body);
      // print(jsonData);
      posts = jsonData;
      print(posts.length);
    }
    else{
      print("failed");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_,index){
        return ListTile(
          title: Text(posts[index]['title'].toString()),
        );
      }),
    );
  }
}
