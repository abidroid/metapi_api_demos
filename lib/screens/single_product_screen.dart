
import 'dart:convert';

import 'package:flare_rating/flare_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {

  @override
  void initState() {
    // TODO: implement initState
    getSingleProduct();
    super.initState();
  }

  Future<Product> getSingleProduct() async {

    String url = 'https://fakestoreapi.com/products/11';
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);

    if( response.statusCode == 200 ){

      var jsonResponse = jsonDecode(response.body);

      Product product = Product.fromJson(jsonResponse);
      return product;
    }

    return Product();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Product'),
        backgroundColor: Colors.green,
      ),

      body: FutureBuilder<Product>(
          future: getSingleProduct(),
          builder: (context, snapshot){

            if( snapshot.hasData){

              Product product = snapshot.data as Product;

              return Card(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 16,
                  children: [

                    Center(child: Image.network(product.image!, width: 200, height: 200,)),
                    Text(product.title ?? "nishta", style: TextStyle(fontSize: 20, fontWeight: .bold),),
                    Text('${product.price}\$' ?? "nishta", style: TextStyle(color: Colors.red, fontWeight: .bold, fontSize: 20),),
                    Row(
                      spacing: 16,
                      children: [
                        FlareRating(
                          rating: product.rating?.rate ?? 0.0,
                          allowHalfRating: true,
                          itemCount: 5,
                          //onRatingUpdate: (value) => setState(() => _rating = value),
                        ),
                        Text("(${product.rating?.count ?? 0})", style: TextStyle(fontSize: 20, fontWeight: .bold),)
                      ],
                    ),

                    Text('${product.description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: .bold,
                          fontSize: 20),)


                  ],
                ),
              );
            }
            else
            {
              return Center(child: SpinKitRipple(color: Colors.green, size: 150,),);
            }
          }),
    );
  }
}
