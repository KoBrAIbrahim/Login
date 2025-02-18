class User {
  final String username;
  final String email;
  final String password;
  final bool gender;

  User({required this.username, required this.email, required this.password , required this.gender});

  String displayRole() {
    return "User: $username";
  }
}

class Admin extends User {
  final String adminLevel;

  Admin({
    required String username,
    required String email,
    required String password,
    required this.adminLevel,
    required bool gender ,
  }) : super(username: username, email: email, password: password , gender: gender);

  @override
  String displayRole() {
    return "User: $username is an Admin with level: $adminLevel";
  }
}

class Customer extends User {
  final String address;

  Customer({
    required String username,
    required String email,
    required String password,
    required this.address,
    required bool gender ,
  }) : super(username: username, email: email, password: password, gender: gender);

  @override
  String displayRole() {
    return "User: $username is a Customer living at: $address";
  }
}
