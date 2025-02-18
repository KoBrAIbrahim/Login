import 'package:flutter/material.dart';
import 'package:simple_app/Pages/main_page.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/product_Used/product.dart'; 

class DeleteProductPage extends StatefulWidget {
  final ProductService productService;

  DeleteProductPage({required this.productService});

  @override
  _DeleteProductPageState createState() => _DeleteProductPageState();
}

class _DeleteProductPageState extends State<DeleteProductPage> {
  List<Product> selectedProducts = []; 

  @override
  Widget build(BuildContext context) {
    List<Product> allProducts = widget.productService.getProducts();

    return Scaffold(
      appBar: AppBar(title: Text('Delete Product'), backgroundColor: Colors.blue),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage(
                              productService: widget.productService,
                              username: '',
                            )));
              },
              child: Text('Delete Selected Products'),
            ),
          ],
        ),
      ),
    );
  }
}
