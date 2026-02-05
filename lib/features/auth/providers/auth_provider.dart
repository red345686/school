import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Implement Firebase Authentication
      // For now, using mock data
      await Future.delayed(const Duration(seconds: 2));

      // Mock user - Replace with actual Firebase auth
      _user = UserModel(
        id: '1',
        email: email,
        name: 'John Doe',
        role: _determineRole(email),
        createdAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Implement Firebase Authentication
      await Future.delayed(const Duration(seconds: 2));

      _user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: name,
        role: role,
        createdAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  UserRole _determineRole(String email) {
    // Simple logic to determine role based on email
    // Replace with actual logic from your backend
    if (email.contains('student')) return UserRole.student;
    if (email.contains('teacher')) return UserRole.teacher;
    if (email.contains('admin')) return UserRole.admin;
    return UserRole.student;
  }
}
