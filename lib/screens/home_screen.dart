
import 'package:flutter/material.dart';
import 'package:metapi_api_demos/screens/get_post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Examples'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Show Post'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return GetPostScreen();
                }));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Show Products'),
              onTap: (){},
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Show User'),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }
}
