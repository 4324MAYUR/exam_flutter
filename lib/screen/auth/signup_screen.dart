 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BG Image
          Positioned.fill(
            child: Image.asset(
              'assets/login_image/background.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  // Logo Image
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/login_image/logo.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.only(
                        bottom: 1,
                        left: 1,
                        right: 1,
                        top: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          // First Name
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "First name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Last Name
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Last name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Email
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "E-mail",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Password
                          TextField(
                            controller: passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Confirm Password
                          TextField(
                            controller: conPassController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Sign In Link
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Already have any account? ",
                                style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign in",
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.back();
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
