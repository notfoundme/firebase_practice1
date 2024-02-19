import 'package:firebase_first/viewmodel/login_vm.dart';
import 'package:firebase_first/views/home_screen.dart';
import 'package:firebase_first/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    final vm2 = Provider.of<LoginVm>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login",
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
            //when clicked Initiate a loginUser event
            vm2.loginUser(email, password);
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
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
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

        Consumer<LoginVm>(builder: (context, vm, _) {
          if (vm.loginStatus == 0) {
            return Container();
          } else if (vm.loginStatus == 1) {
            return const CircularProgressIndicator();
          } else if (vm.loginStatus == 2) {
            //screen build huda navigation garna paaidaina causes error.
            //so written in this funn
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                ),
              );
            });
            return Container();
          }
          // error state case
          return const Text(
            "Cannot login",
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
