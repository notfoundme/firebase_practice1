import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first/repo/auth_repo/auth_repo.dart';

class FirebaseAuthRepoImpl implements AuthRepo {
  FirebaseAuth fAuth = FirebaseAuth.instance;
  @override
  bool isUserLoggedIn() {
    User? user = fAuth.currentUser;
    return  user != null;
  }

  @override
  Future<bool> userLogin(String email, String pw) async {
    try {
      UserCredential loginData =
          await fAuth.signInWithEmailAndPassword(email: email, password: pw);
      if (loginData.user != null) {
        return true; // Login successful
      } else {
        return false; // Login failed
      }
    } catch (e) {
      throw Exception("Unknown error occurred");
    }
  }

  @override
  Future<bool> userSignout() async {
    try {
      await fAuth.signOut();
      return true; // Signout successful
    } catch (e) {
      return false; // Signout failed
    }
  }

  @override
  Future<bool> userSignup(String email, String pw) async {
    try {
      UserCredential userData = await fAuth.createUserWithEmailAndPassword(
          email: email, password: pw);
      if (userData.user == null) {
        return false; // Signup failed
      } else {
        return true; // Signup successful
      }
    } catch (e) {
      throw Exception("Unknown error occured");
    }
  }
}

