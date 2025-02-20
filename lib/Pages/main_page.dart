import 'package:flutter/material.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/product_Used/product.dart';
import 'package:simple_app/models/user.dart';

class MainPage extends StatefulWidget {
  final String username;
  final ProductService productService;
  final User? user;

  MainPage({
    required this.username,
    required this.productService,
    required this.user,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isEditMode = false;
  List<Product> selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    List<Product> allProducts = widget.productService.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(isEditMode ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                isEditMode = !isEditMode;
                if (!isEditMode) selectedProducts.clear();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              if (widget.user != null) {
                Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: widget.user,
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Thanks for logging in, ${widget.username}!',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                final product = allProducts[index];
                return ListTile(
                  leading: isEditMode
                      ? Checkbox(
                          value: selectedProducts.contains(product),
                          onChanged: (bool? selected) {
                            setState(() {
                              if (selected == true) {
                                selectedProducts.add(product);
                              } else {
                                selectedProducts.remove(product);
                              }
                            });
                          },
                        )
                      : null,
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price}'),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 140, 157, 211),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/addProduct',
                      arguments: {
                        'productService': widget.productService,
                        'username': widget.username,
                        'user': widget.user,
                      },
                    );
                  },
                  child: const Text('Add Product'),
                ),
              ),
              if (isEditMode)
                ElevatedButton(
                  onPressed: selectedProducts.isNotEmpty
                      ? () {
                          setState(() {
                            for (var product in selectedProducts) {
                              widget.productService.removeProduct(product.name);
                            }
                            selectedProducts.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected products deleted'),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Delete Selected'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
