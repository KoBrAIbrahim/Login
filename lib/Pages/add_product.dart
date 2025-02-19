import 'package:flutter/material.dart';
import 'package:simple_app/Pages/main_page.dart';
import 'package:simple_app/models/product_Used/product.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/user.dart';

class AddProductPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final ProductService productService;
  final String username;
  final User user;

  AddProductPage({required this.productService, required this.username, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                productService.addProduct(Product(
                  id: ProductService().getProducts().length + 1,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  quantity: int.parse(quantityController.text),
                ));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage(
                              productService: productService,
                              username: '',
                              users: user,
                            )));
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
