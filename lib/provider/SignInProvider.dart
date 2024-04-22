import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // User? _user;

  // User? get user => _user;

  // // Sign in with Google
  // Future<void> signInWithGoogle() async {
  //   try {
  //     // Trigger the Google sign-in flow
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       // Obtain the auth details from the request
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;

  //       // Create a new credential
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );

  //       // Sign in to Firebase with the credential
  //       final UserCredential userCredential =
  //           await _auth.signInWithCredential(credential);

  //       // Update the user state
  //       _user = userCredential.user;

  //       // Notify listeners
  //       notifyListeners();
  //     }
  //   } catch (error) {
  //     // Handle the error appropriately
  //     print("An error occurred while signing in: $error");
  //     // You can throw the error again to let the caller handle it
  //     throw error;
  //   }
  // }

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
