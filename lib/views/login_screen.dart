import 'package:firebase_first/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();


  @override
  void dispose() {
    // be a good citizen
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Sign up",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
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
            print(email + " " + password);

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
                    "Login",
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

        //not signed in?

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not signed up yet,",
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the signup screen when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  const SignUpScreen(
                           
                          )),
                );
              },
              child: Text(
                "Signup",
                style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
