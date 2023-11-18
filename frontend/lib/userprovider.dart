// user_provider.dart

import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String? userEmail;
  int? userId;
  String? userRole;
  String? userName;

  void setUser(String fullname,String email, String role, int id) {
    userEmail = email;
    userId = id;
    userRole = role;
    userName = fullname;
    notifyListeners();
  }
}
