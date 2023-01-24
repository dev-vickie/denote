import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/page_text.dart';
import '../widgets/submit_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/book.png",
                    height: MediaQuery.of(context).size.height * 0.38,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      PageText(pageTitle: "Forgot"),
                      PageText(pageTitle: "Password?")
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Don't Worry! It happens. Please enter the email adress associated with your account",
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    hidePassword: false,
                    controller: emailController,
                    icon: Icons.email_rounded,
                    hintText: "Recovery Email",
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
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Sent,Check your email"),
                          ),
                        );
                      }
                    },
                    child: const SubmitButton(
                      buttonText: "Send recovery email",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
