import 'package:flutter/material.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/product_Used/product.dart';

class EditProductPage extends StatefulWidget {
  final ProductService productService;

  EditProductPage({required this.productService});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  List<Product> selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    List<Product> allProducts = widget.productService.getProducts();

    return Scaffold(
      appBar: AppBar(title: Text('Edit Products'), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(allProducts[index].name),
                    value: selectedProducts.contains(allProducts[index]),
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected != null) {
                          if (selected) {
                            selectedProducts.add(allProducts[index]);
                          } else {
                            selectedProducts.remove(allProducts[index]);
                          }
                        }
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                for (var product in selectedProducts) {
                  widget.productService.removeProduct(product.name);
                }
                setState(() {
                  selectedProducts.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected products deleted')),
                );
              },
              child: Text('Delete Selected Products'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
