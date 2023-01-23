import 'package:denote/auth/firebase_service/firebase_auth.dart';
import 'package:denote/auth/pages/forgot_password.dart';
import 'package:denote/auth/pages/register_page.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/page_text.dart';
import '../widgets/submit_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    "assets/book.png",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PageText(
                    pageTitle: "Login",
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Input Email TextField
                  CustomTextField(
                    controller: emailController,
                    icon: Icons.alternate_email_outlined,
                    hintText: "Email",
                    validator: (value) {
                      RegExp regex = RegExp(r'\w+@\w+\.\w+');
                      if (value!.isEmpty) {
                        return "Please enter an email adress";
                      } else if (!regex.hasMatch(value)) {
                        return "Please enter a valid email adress";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Password Input Field
                  CustomTextField(
                    controller: passwordController,
                    icon: Icons.lock_outline_rounded,
                    hintText: "Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your password");
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),

                  //Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  //Submit Button
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                        AuthService.signInEmailPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                    child: const SubmitButton(buttonText: "Login"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    child: Text(
                      "OR",
                    ),
                  ),

                  //Navigate to register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New to this app?",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
