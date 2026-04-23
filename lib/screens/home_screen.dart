
import 'package:flutter/material.dart';
import 'package:metapi_api_demos/screens/add_post_screen.dart';
import 'package:metapi_api_demos/screens/get_post_screen.dart';
import 'package:metapi_api_demos/screens/products_list_screen.dart';
import 'package:metapi_api_demos/screens/single_product_screen.dart';

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
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ProductsListScreen();
                }));
              },
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Show User'),
              onTap: (){},
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Show Product'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return SingleProductScreen();
                }));
              },
            ),
          ),


          Card(
            child: ListTile(
              title: Text('Add Post'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return AddPostScreen();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
