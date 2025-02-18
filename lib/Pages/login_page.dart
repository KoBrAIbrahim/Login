import 'package:flutter/material.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/user.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_textfield.dart';
import 'main_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ProductService productService;
  final Map<String, User> users;

  LoginPage({required this.productService, required this.users});

  void _login(BuildContext context) {
    final AuthController _authController = AuthController(users: users);
    bool auth =
        _authController.login(usernameController.text, passwordController.text);
    print(auth);
    if (auth) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainPage(
                  username: usernameController.text,
                  productService: productService,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Login Page'), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/login.jpg',
              height: 150,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                controller: usernameController,
                label: "Username",
                icon: Icons.person),
            SizedBox(height: 10),
            CustomTextField(
                controller: passwordController,
                label: "Password",
                icon: Icons.lock,
                isPassword: true),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage(
                            productService: productService,
                            users: users,
                          ))),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
