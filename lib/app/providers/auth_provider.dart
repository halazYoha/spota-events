import 'package:flutter/material.dart';
import 'package:spota_events/shared/models/user_model.dart';
import 'package:spota_events/shared/services/auth_service.dart';
import 'dart:async';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel _currentUser = UserModel.empty();
  bool _isLoading = false;
  String? _error;

  // Getters
  UserModel get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _currentUser.uid.isNotEmpty;

  AuthProvider() {
    _init();
  }

  void _init() {
    _authService.authStateChanges.listen((user) async {
      print('DEBUG: Auth state changed, user: ${user?.email}');
      if (user != null) {
        _setLoading(true);
        // User is logged in, fetch profile
        try {
          final userModel = await _authService.getCurrentUser();
          print(
              'DEBUG: Got user model: ${userModel?.email}, role: ${userModel?.role}');
          // getCurrentUser now always returns a UserModel when user is not null
          // It uses fallback data if Firestore is unavailable
          _currentUser = userModel ?? UserModel.empty();
          print(
              'DEBUG: Current user set to: ${_currentUser.email}, isLoggedIn: $isLoggedIn');
        } catch (e) {
          print('Error fetching user profile: $e');
          _currentUser = UserModel.empty();
        }
        _setLoading(false);
      } else {
        print('DEBUG: User is null, logging out');
        _currentUser = UserModel.empty();
        _setLoading(false);
      }
    });
  }

  // void _fetchUserProfile(String uid) async {
  //   // Disabled for mock mode
  // }

  // Login
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _error = null;

    try {
      _currentUser = await _authService.signIn(email, password);
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Signup
  Future<bool> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    String? organization,
    String? bio,
  }) async {
    _setLoading(true);
    _error = null;

    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty || phone.isEmpty) {
        throw Exception('Please fill all required fields');
      }

      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      print('DEBUG: Starting signup for $email');
      _currentUser = await _authService.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        role: role,
        organization: organization,
        bio: bio,
      );

      print('DEBUG: Signup successful, user: ${_currentUser.email}');
      notifyListeners();
      return true;
    } catch (e) {
      print('DEBUG: Signup error: $e');
      _error = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Logout
  Future<void> logout() async {
    _setLoading(true);
    try {
      await _authService.signOut();
    } catch (e) {
      print('Error during logout: $e');
    } finally {
      // Ensure user is cleared and loading is stopped regardless of errors
      _currentUser = UserModel.empty();
      notifyListeners();
      _setLoading(false);
    }
  }

  // Password reset
  Future<bool> resetPassword(String email) async {
    _setLoading(true);
    _error = null;

    try {
      if (email.isEmpty) {
        throw Exception('Please enter your email');
      }

      await _authService.sendPasswordResetEmail(email);
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Update user profile
  Future<bool> updateProfile({
    required String name,
    required String phone,
    String? organization,
    String? bio,
  }) async {
    _setLoading(true);
    _error = null;

    try {
      final updatedUser = UserModel(
        uid: _currentUser.uid,
        email: _currentUser.email,
        name: name,
        phone: phone,
        role: _currentUser.role,
        organization: organization,
        bio: bio,
        createdAt: _currentUser.createdAt,
      );

      await _authService.updateProfile(updatedUser);
      _currentUser = updatedUser;

      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
