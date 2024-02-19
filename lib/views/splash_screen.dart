import 'package:firebase_first/repo/auth_repo/auth_repo.dart';
import 'package:firebase_first/repo/auth_repo/auth_repo_impl.dart';
import 'package:firebase_first/views/home_screen.dart';
import 'package:firebase_first/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // suruma ui load hunxa then this is called.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(Duration(seconds: 2));
        final AuthRepo authRepo = FirebaseAuthRepoImpl();
        if (authRepo.isUserLoggedIn()) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          CircularProgressIndicator(),
          Text(
            "Firebase",
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
