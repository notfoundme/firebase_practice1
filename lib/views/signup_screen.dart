import 'package:firebase_first/viewmodel/signup_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final vm1 = Provider.of<SignUpVm>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          "Sign up",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        //email
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(10.0),
              ),
              label: const Text("Enter your Email"),
            ),
          ),
        ),
        //password
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: pwController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(10.0),
              ),
              label: const Text("Enter your password"),
            ),
            obscureText: true,
          ),
        ),

        //login button
        GestureDetector(
          onTap: () {
            String email = emailController.text;
            String password = pwController.text;
            vm1.signupUser(email, password);
            emailController.clear();
            pwController.clear();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        //
        Consumer<SignUpVm>(builder: (context, vm, _) {
          if (vm.signupStatus == 0) {
            return Container();
          } else if (vm.signupStatus == 1) {
            return const CircularProgressIndicator();
          } else if (vm.signupStatus == 2) {
            return Container();
          }
          // error state case
          return const Text(
            "Cannot sign in",
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ]),
    );
  }
}
