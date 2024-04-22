import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class SignInProvider extends ChangeNotifier {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
    bool _isAuthorized = false;
     bool get isAuthorized => _isAuthorized;
  // Sign in with Google
  Future<bool> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    

    // Once signed in, return the UserCredential
    try {
      var userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
          
      print(userCredential);

      _isAuthorized = FirebaseAuth.instance.currentUser != null;
      return isAuthorized;
    } catch (error) {
      // Handle the error appropriately
      print("An error occurred while signing in: $error");
      // Optionally, you can throw the error again to let the caller handle it
      throw error;
    }

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
  // Sign out
  // Future<void> signOut() async {
  //   try {
  //     await _auth.signOut();
  //     _user = null;
  //     // Notify listeners
  //     notifyListeners();
  //   } catch (error) {
  //     // Handle the error appropriately
  //     print("An error occurred while signing out: $error");
  //     // You can throw the error again to let the caller handle it
  //     throw error;
  //   }
  // }
}
