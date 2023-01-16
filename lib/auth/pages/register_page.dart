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
  String? dropDownValue = "Select Course";
  String? dropDownYear = "Year";
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
                  const CustomTextField(
                    icon: Icons.perm_identity_rounded,
                    hintText: "First Name",
                  ),
                  const SizedBox(height: 15),

                  //Select Course and Year
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField(
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.workspace_premium),
                          ),
                          value: dropDownValue,
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
                  const CustomTextField(
                    icon: Icons.email,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 15),

                  //Password input field
                  const CustomTextField(
                    icon: Icons.lock_outline_rounded,
                    hintText: "Password",
                  ),
                  const SizedBox(height: 20),

                  //Confirm Password field
                  const CustomTextField(
                    icon: Icons.lock_outline_rounded,
                    hintText: "Confirm Password",
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
                    onTap: () {},
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
