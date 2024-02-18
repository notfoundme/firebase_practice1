import 'package:firebase_first/viewmodel/signup_vm.dart';
import 'package:firebase_first/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<SignUpVm>(
      create: (context) => SignUpVm(),
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
