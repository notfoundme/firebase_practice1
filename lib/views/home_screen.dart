// ignore_for_file: use_build_context_synchronously

import 'package:firebase_first/repo/auth_repo/auth_repo.dart';
import 'package:firebase_first/repo/auth_repo/auth_repo_impl.dart';
import 'package:firebase_first/views/splash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthRepo authRepo = FirebaseAuthRepoImpl();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () async {
                bool signout = await authRepo.userSignout();
                if (signout) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const SplashScreen()));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cannot signout ")));
                }
              },
              child: const Icon(Icons.logout))
        ],
      ),
      body: const Column(
        children: [Text("Home Screen")],
      ),
    );
  }
}
