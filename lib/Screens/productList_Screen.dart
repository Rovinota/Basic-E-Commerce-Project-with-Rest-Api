import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Column(
        children: [
          ListTile(

            leading: Image.network("https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", width: 100,),
            title: Text('Product Title'),
            trailing: Text("\$20"),
            subtitle: Text("Product Description"),
          )
        ],
      ),
    );
  }
}
