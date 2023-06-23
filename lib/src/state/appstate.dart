import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class AppState extends ChangeNotifier {
  // Private static instance variable
  static AppState? _instance;

  // Private constructor
  AppState._();

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // Public getter to access the instance
  static AppState get instance {
    _instance ??= AppState._(); // Create instance if it doesn't exist
    return _instance!;
  }

  // $AppState logs in user
  void loginUser() {
    _isLoggedIn = true;
    developer.log('AppState logs in user', name: 'Login User');
    notifyListeners();
  }

  // $AppState logs out user
  void logoutUser() {
    _isLoggedIn = false;
    developer.log('AppState logs out user', name: 'Logout User');
    notifyListeners();
  }
}
