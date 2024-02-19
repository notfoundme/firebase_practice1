import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_first/firebase_options.dart';
import 'package:firebase_first/viewmodel/login_vm.dart';
import 'package:firebase_first/viewmodel/signup_vm.dart';
import 'package:firebase_first/views/login_screen.dart';
import 'package:firebase_first/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// since this is providing the [ChangeNotifier]
    /// see  https://stackoverflow.com/a/68811697
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginVm(),
      child: ChangeNotifierProvider(
        create: (context) => SignUpVm(),
        child: const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );
  }
}
