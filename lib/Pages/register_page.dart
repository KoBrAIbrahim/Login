import 'package:flutter/material.dart';
import 'package:simple_app/Pages/login_page.dart';
import 'package:simple_app/models/product_Used/product_service.dart';
import 'package:simple_app/models/user.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  final ProductService productService;
  final Map<String, User> users;
  const RegisterPage({super.key, required this.productService, required this.users});

  @override
  _RegisterPageState createState() =>
      _RegisterPageState(productService: productService, users: users);
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ProductService productService;
  final Map<String, User> users;
  _RegisterPageState({required this.productService, required this.users});

  String? selectedRole = 'Admin';
  bool isMale = true;
  bool _isPasswordVisible = false;

  void _register(BuildContext context) {
    final AuthController _authController = AuthController(users: users);
    _authController.register(
        usernameController.text, emailController.text, passwordController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(
                productService: productService,
                users: users,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Register Page'), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
                controller: usernameController,
                label: "Username",
                icon: Icons.person),
            SizedBox(height: 10),
            CustomTextField(
                controller: emailController, label: "Email", icon: Icons.email),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            DropdownButton<String>(
              value: selectedRole,
              iconSize: 60.0,
              iconEnabledColor: Colors.blueGrey,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue;
                });
              },
              items: <String>['Admin', 'User']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select Role'),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Male'),
                Switch(
                  value: isMale,
                  onChanged: (bool newValue) {
                    setState(() {
                      isMale = newValue;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Sign up'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Go Back to Login page'),
            ),
          ],
        ),
      ),
    );
  }
}
