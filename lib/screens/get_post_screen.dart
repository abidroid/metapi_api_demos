
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
    String url = 'https://jsonplaceholder.typicode.com/posts/11';
    Uri uri = Uri.parse(url);

    http.Response response = await http.get( uri);

    if( response.statusCode == 200 ){
      var jsonResponse = jsonDecode(response.body);

      Post post = Post.fromJson(jsonResponse);
      print(jsonResponse);

      return post;
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
      body: FutureBuilder<Post>(
          future: getPostFromAPI(),
          builder: (context, snapshot){

            if( snapshot.hasData){

              Post post = snapshot.data as Post;

              return Column(
                children: [
                  Text(post.userId?.toString() ?? "NO ID"),
                  Text(post.id?.toString() ?? "NO title"),
                  Text(post.title ?? "NO title"),
                  Text(post.body ?? "NO body"),
                ],
              );

            }else{
              return Center(child: CircularProgressIndicator(),);
            }
      }),
    );
  }
}
