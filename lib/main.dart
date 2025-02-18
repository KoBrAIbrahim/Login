import 'package:flutter/material.dart';
import 'package:simple_app/Pages/login_page.dart';
import 'package:simple_app/models/product_Used/product.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/user.dart';

void main() {
  User admin = Admin(
    username: "Ali",
    email: "ali@gmail.com",
    password: "123123123",
    adminLevel: "Super",
    gender: true,
  );

  User customer = Customer(
    username: "Ibrahim",
    email: "ibrahim@gmail.com",
    password: "123123123",
    address: "12 Main Street",
    gender: true,
  );

  Map<String, User> users = {
    admin.username: admin,
    customer.username: customer,
  };

  final ProductService productService = ProductService();
  productService
      .addProduct(Product(id: 1, name: "Laptop", price: 1000.0, quantity: 5));
  productService
      .addProduct(Product(id: 2, name: "Phone", price: 500.0, quantity: 10));
  productService.addProduct(
      Product(id: 3, name: "Headphones", price: 150.0, quantity: 15));
  productService
      .addProduct(Product(id: 4, name: "Mouse", price: 50.0, quantity: 20));
  productService
      .addProduct(Product(id: 5, name: "Keyboard", price: 80.0, quantity: 12));

  runApp(MyApp(
    productService: productService,
    users: users,
  ));
}

class MyApp extends StatelessWidget {
  final ProductService productService;
  final Map<String, User> users;
  MyApp({required this.productService, required this.users});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        productService: productService,
        users: users,
      ),
    );
  }
}
