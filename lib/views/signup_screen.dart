import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  final String email;
  final String pw;
  const SignUpScreen({super.key, required this.email, required this.pw});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          "Sign up",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        //email
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(10.0),
              ),
              label: Text("email"),
            ),
          ),
        ),
        //password
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: pwController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(10.0),
              ),
              label: Text("Enter your password"),
            ),
            obscureText: true,
          ),
        ),

        //login button
        GestureDetector(
          onTap: () {
            String email = emailController.text;
            String password = pwController.text;
            print(email +" "+ password);
            setState(() {});
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
      ]),
    );
  }
}
