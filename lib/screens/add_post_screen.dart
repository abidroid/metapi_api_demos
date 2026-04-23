
import 'package:flutter/material.dart';
import 'package:metapi_api_demos/models/post.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  // type inference
  var userIdC = TextEditingController();
  var titleC = TextEditingController();
  var bodyC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: userIdC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'User ID',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: titleC,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),

              ),

            ),

            TextField(
              controller: bodyC,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Body',
                border: OutlineInputBorder(),

              ),

            ),
            
            ElevatedButton(onPressed: (){
              String userId = userIdC.text.trim();
              String title = titleC.text.trim();
              String body = bodyC.text.trim();

              if( userId.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please provide user id'))
                );
                return;
              }


              if( title.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please provide title'))
                );
                return;
              }


              if( body.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please provide body description'))
                );
                return;
              }


              Post post = Post(userId: int.parse(userId!), title: title, body: body);

            }, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
