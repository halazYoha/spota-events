import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spota_events/shared/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Fetch current user profile
  Future<UserModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    try {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data()!, user.uid);
      }
      return null;
    } catch (e) {
      print('Error fetching user from Firestore: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future<UserModel> signIn(String email, String password) async {
    User? user;

    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
    } catch (e) {
      // Handle PigeonUserDetails type cast error - Firebase Auth plugin bug
      if (e.toString().contains('PigeonUserDetails') ||
          e.toString().contains('type cast')) {
        print('Caught PigeonUserDetails error in signIn, getting current user');
        await Future.delayed(const Duration(milliseconds: 500));
        user = _auth.currentUser;
      } else {
        throw Exception(e.toString().replaceAll('Exception: ', ''));
      }
    }

    if (user == null) throw Exception('Sign in failed');

    // Fetch user profile from Firestore
    try {
      print('DEBUG: Fetching user profile from Firestore for ${user.uid}');
      final doc = await _firestore.collection('users').doc(user.uid).get();
      print('DEBUG: Firestore doc exists: ${doc.exists}');
      if (doc.exists) {
        final userModel = UserModel.fromMap(doc.data()!, user.uid);
        print(
            'DEBUG: User loaded from Firestore: ${userModel.email}, role: ${userModel.role}');
        return userModel;
      } else {
        throw Exception('User profile not found');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      throw Exception('Failed to load user profile');
    }
  }

  // Sign up
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required UserRole role,
    String? organization,
    String? bio,
  }) async {
    User? user;

    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
    } catch (e) {
      // Handle PigeonUserDetails type cast error - Firebase Auth plugin bug
      if (e.toString().contains('PigeonUserDetails') ||
          e.toString().contains('type cast')) {
        print('Caught PigeonUserDetails error in signUp, getting current user');
        await Future.delayed(const Duration(milliseconds: 500));
        user = _auth.currentUser;
      } else {
        throw Exception(e.toString().replaceAll('Exception: ', ''));
      }
    }

    if (user == null) throw Exception('Sign up failed');

    final newUser = UserModel(
      uid: user.uid,
      email: email,
      name: name,
      phone: phone,
      role: role,
      organization: organization,
      bio: bio,
      createdAt: DateTime.now(),
    );

    // Save to Firestore
    try {
      await _firestore.collection('users').doc(user.uid).set(newUser.toMap());
      print('User profile saved to Firestore successfully');
    } catch (e) {
      print('Error saving to Firestore: $e');
      // Don't throw - user is created in Auth, profile save can be retried
    }

    return newUser;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Reset Password
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Update Profile
  Future<void> updateProfile(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).update(user.toMap());
    } catch (e) {
      print('Error updating profile: $e');
      rethrow;
    }
  }
}
