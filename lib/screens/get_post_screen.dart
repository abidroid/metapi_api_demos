
import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;

class GetPostScreen extends StatefulWidget {
  const GetPostScreen({super.key});

  @override
  State<GetPostScreen> createState() => _GetPostScreenState();
}

class _GetPostScreenState extends State<GetPostScreen> {


  Future<Post> getPostFromAPI() async {
    print('Called');
    String url = 'https://jsonplaceholder.typicode.com/posts/10';
    Uri uri = Uri.parse(url);

    http.Response response = await http.get( uri);

    if( response.statusCode == 200 ){
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse);
    }else{
      print('SWW');
    }

    return Post();
  }


  @override
  void initState() {
    getPostFromAPI();
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get POST'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
