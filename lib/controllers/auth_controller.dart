import 'package:simple_app/models/user.dart';

abstract class AuthService {
  bool login(String username, String password);
  void register(String username, String email, String password);
}

class AuthController implements AuthService {
  Map<String, User> users;
  AuthController({required this.users});
  @override
  bool login(String username, String password) {
    if (users.containsKey(username)) {
      if (users[username]?.password == password) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  void register(String username, String email, String password) {
    User user = new Admin(
        username: username,
        email: email,
        password: password,
        gender: true,
        adminLevel: 'Super');
    users[username] = user;

   users.forEach((username, user) {
    print('Username: $username');
    print('Email: ${user.email}');
    print('Gender: ${user.gender ? "Male" : "Female"}');
    print('---');
  });
  }
}
