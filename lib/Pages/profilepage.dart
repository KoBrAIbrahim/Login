import 'package:flutter/material.dart';
import 'package:simple_app/models/user.dart';
import 'package:simple_app/widgets/prfile_text.dart';

class ProfilePage extends StatelessWidget {
  final User users;

  ProfilePage({required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth < 400 ? 16 : 20;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Center(
                  child: Text(
                    "User Profile",
                    style: TextStyle(fontSize: fontSize + 4, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Flexible(child: CustomUsernameText(content: "Username: ${users.username}",fontSize: fontSize),),
                SizedBox(height: 10),
                Flexible(child: CustomUsernameText(content:  "Email: ${users.email}",fontSize: fontSize),),
                SizedBox(height: 10),
                Flexible(child: CustomUsernameText(content:  "Gender: ${users.gender ? "Male" : "Female"}",fontSize: fontSize),),
                SizedBox(height: 20),
                SizedBox(
                  width:  MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back to Main Page"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
