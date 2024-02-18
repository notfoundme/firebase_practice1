import 'package:firebase_first/repo/auth_repo/auth_repo.dart';
import 'package:firebase_first/repo/auth_repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';

class SignUpVm with ChangeNotifier {
  final AuthRepo authRepo = FirebaseAuthRepoImpl();
  // 0 = idle state
  //1 = loading state
  //2 = loaded state
  //3 = error state
  int _signupStatus = 0;
  int get signupStatus => _signupStatus;

  Future<void> signupUser(String email, String pw) async {
    _signupStatus = 1;
    notifyListeners();

    try {
      bool isSuccessful = await authRepo.userSignup(email, pw);

      if (isSuccessful) {
        _signupStatus = 2;
        notifyListeners();
      } else {
        _signupStatus = 3;
        notifyListeners();
      }
    } catch (e) {
      _signupStatus = 3;
      notifyListeners();
    }
  }
}
