
import 'package:firebase_first/repo/auth_repo/auth_repo.dart';
import 'package:firebase_first/repo/auth_repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';

class LoginVm with ChangeNotifier{
  final AuthRepo authRepo = FirebaseAuthRepoImpl();
 // 0 = idle state
  //1 = loading state
  //2 = loaded state
  //3 = error state
    int _loginStatus = 0;
  int get loginStatus => _loginStatus;

  Future<void> loginUser(String email, String pw) async {
    _loginStatus = 1;
    notifyListeners();

    try {
      bool isSuccessful = await authRepo.userLogin(email, pw);

      if (isSuccessful) {
        _loginStatus = 2;
        notifyListeners();
      } else {
        _loginStatus = 3;
        notifyListeners();
      }
    } catch (e) {
      _loginStatus = 3;
      notifyListeners();
    }
  }
}