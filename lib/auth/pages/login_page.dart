import 'package:denote/auth/pages/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../main.dart';
import '../utils/show_error.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/page_text.dart';
import '../../widgets/submit_button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

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
  Future<void> signInEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigatorKey.currentState!.pop();

      //show success snackbar if sign in is successful
      messengerKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Login Sucess"),
          backgroundColor: Colors.blue,
        ),
      );
      print("done");
      //pop the loading indicator
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      //pop the indicator on error
      navigatorKey.currentState!.pop();
      //show the error in the snackbar
      showErrorMessage(error.code, context);
    }
  }

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
                    hidePassword: false,
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
                    hidePassword: true,
                    suffixIcon: Icons.remove_red_eye_rounded,
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
                        signInEmailPassword(
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
                        onPressed: widget.onTap,
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
