abstract class AuthRepo {
  Future<bool> userLogin(String email, String pw);
  Future<bool> userSignup(String email, String pw);
  Future<bool> userSignout();
  bool isUserLoggedIn();
}


