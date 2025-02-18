import 'package:flutter/material.dart';
import 'package:simple_app/Pages/add_product.dart';
import 'package:simple_app/Pages/delete_product.dart';
import 'package:simple_app/models/product_Used/product_service.dart';

class MainPage extends StatelessWidget {
  final String username;
  final ProductService productService;

  MainPage({required this.username , required this.productService});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Thanks for logging in, $username!',
                style: TextStyle(fontSize: 18.0)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productService.getProducts().length,
              itemBuilder: (context, index) {
                final product = productService.getProducts()[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price}'),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProductPage(productService: productService,username: username,)),
                  );
                },
                child: Text('Add Product'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeleteProductPage(productService: productService,)),
                  );
                },
                child: Text('Delete Product'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
