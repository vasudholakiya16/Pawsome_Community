import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  // Twitter Sign-In
  Future<User?> signInWithTwitter() async {
    try {
      final twitterLogin = TwitterLogin(
        apiKey: 'qjnztZsx4RJdT283v8leLT1xL',
        apiSecretKey: '950O9GvHOQ4B6rFkn2odLcXjqQjfJUMlWYrZF1RZFPfxUHZLz1',
        redirectURI: 'https://stripesetupproject.firebaseapp.com/__/auth/handler',
      );

      final authResult = await twitterLogin.login();

      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final authToken = authResult.authToken;
        final authTokenSecret = authResult.authTokenSecret;

        if (authToken != null && authTokenSecret != null) {
          final AuthCredential credential = TwitterAuthProvider.credential(
            accessToken: authToken,
            secret: authTokenSecret,
          );

          final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
          return userCredential.user;
        } else {
          print('Missing Twitter authToken or authTokenSecret');
          return null;
        }
      } else {
        // Twitter sign-in failed
        print('Twitter sign-in failed: ${authResult.errorMessage}');
        return null;
      }
    } catch (e) {
      print("Error signing in with Twitter: $e");
      return null;
    }
  }
}
