
// services/auth_service.dart

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  // Requirement 1.8: Store password in encrypted form (SHA-256)
  static String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  // Requirement 1.6: Email format validation logic
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Requirement 1.7: Password minimum 6 characters check
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
