import 'package:denote/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/page_text.dart';
import '../widgets/submit_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  String? dropDownValue = "Select Course";
  String? dropDownYear = "Year";
  String? _confirmPassword;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const PageText(pageTitle: "Sign Up"),
                  const SizedBox(height: 20),

                  //FirstName input
                  CustomTextField(
                    controller: nameController,
                    icon: Icons.perm_identity_rounded,
                    hintText: "First Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your first name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15),

                  //Select Course and Year
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField(
                          value: dropDownValue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please select course";
                            } else if (value == "Select Course") {
                              return "Please select course";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.workspace_premium),
                          ),
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value;
                            });
                          },
                          items: <String>[
                            "Select Course",
                            "Bsc Civil",
                            "Bsc Mechanical",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your year";
                            } else if (value == "Year") {
                              return "Select year";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.view_timeline_rounded),
                          ),
                          value: dropDownYear,
                          onChanged: (value) {
                            setState(() {
                              dropDownYear = value;
                            });
                          },
                          items: <String>[
                            "Year",
                            "2022",
                            "2021",
                            "2020",
                            "2019",
                            "2018",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  //Email input field
                  CustomTextField(
                    controller: emailController,
                    icon: Icons.email,
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
                  const SizedBox(height: 15),

                  //Password input field
                  CustomTextField(
                    //TODO: Add suffix icon to view/hide password
                    controller: passwordController,
                    icon: Icons.lock_outline_rounded,
                    hintText: "Password",
                    validator: (value) {
                      RegExp hasUpper = RegExp(r'[A-Z]');
                      RegExp hasDigit = RegExp(r'\d');
                      if (!RegExp(r'.{8,}').hasMatch(value!)) {
                        return "Password must have atleast 8 Characters";
                      }
                      if (!hasUpper.hasMatch(value)) {
                        return "Put atleast one Uppercase letter";
                      }
                      if (!hasDigit.hasMatch(value)) {
                        return "Put atleast one Digit";
                      }

                      _confirmPassword = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  //Confirm Password field
                  CustomTextField(
                    icon: Icons.lock_outline_rounded,
                    hintText: "Confirm Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please confirm your password";
                      }
                      if (value != _confirmPassword) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "By signing up you agree to our ",
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "terms and conditions",
                          style: TextStyle(color: Colors.blue[700]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Submit button
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Signup Successful"),
                          ),
                        );
                      }
                    },
                    child: const SubmitButton(buttonText: "Signup"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Direct to login page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Joined us before?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "login",
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
