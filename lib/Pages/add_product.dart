import 'package:flutter/material.dart';
import 'package:simple_app/models/product_Used/product.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/user.dart';
import '../widgets/custom_textfield_addproduct.dart';

class AddProductPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final ProductService productService;
  final String username;
  final User user;

  AddProductPage(
      {required this.productService,
      required this.username,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add Product'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFeildAddProduct(
                controller: nameController, labelText: 'Product Name'),
            CustomTextFeildAddProduct(
                controller: priceController, labelText: 'Price'),
            CustomTextFeildAddProduct(
                controller: quantityController, labelText: 'Quantity'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                productService.addProduct(Product(
                  id: productService.getProducts().length + 1,
                  name: nameController.text,
                  price: double.tryParse(priceController.text) ?? 0.0,
                  quantity: int.tryParse(quantityController.text) ?? 0,
                ));

                Navigator.pushNamed(
                  context,
                  '/mainPage',
                  arguments: {
                    'productService': productService,
                    'username': username,
                    'user': user,
                  },
                );
              },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
