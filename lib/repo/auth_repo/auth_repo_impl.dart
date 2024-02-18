import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first/repo/auth_repo/auth_repo.dart';

class FirebaseAuthRepoImpl implements AuthRepo {
  FirebaseAuth fAuth = FirebaseAuth.instance;
  @override
  bool isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> userLogin(String email, String pw) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<bool> userSignout() {
    // TODO: implement userSignout
    throw UnimplementedError();
  }

  @override
  Future<bool> userSignup(String email, String pw) async {
    try {
      UserCredential userData = await fAuth.createUserWithEmailAndPassword(
          email: email, password: pw);
      if (userData.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw Exception("Unknown error occured");
    }
  }
}
