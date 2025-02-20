import 'package:flutter/material.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/user.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  
  final ProductService productService;
  final Map<String, User> users;

  LoginPage({required this.productService, required this.users});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final AuthController _authController =
          AuthController(users: widget.users);
      User? auth = _authController.login(
          usernameController.text, passwordController.text);
      if (auth != null) {
        
        Navigator.pushReplacementNamed(
          context,
          '/mainPage',
          arguments: {
            'username': usernameController.text,
            'productService': widget.productService,
            'user': auth,
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: const Text('Login Page'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login.jpg',
                height: 150,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/registerPage',
                  arguments: {
                    'productService': widget.productService,
                    'users': widget.users,
                  },
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
