import 'package:denote/auth/utils/show_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../main.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/page_text.dart';
import '../../widgets/submit_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

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

  String? selectedCourse = "Select Course";
  String? selectedSemester = "Sem";
  String? _confirmPassword;

  //List of courses/years in the drop down textfields - it is hard-coded for now
  final List<String> coursesList = [
    "Select Course",
    "Bsc Civil",
    "Bed Civil",
    "BTech"
  ];
  final List<String> semesterList = [
    "Sem",
    "3.2",
    "2.2",
    "1.2",
  ];

  //Formkey for form validation
  final _formKey = GlobalKey<FormState>();

  Future<void> createUserEmailPassword(String email, String password) async {
    final firestore = FirebaseFirestore.instance;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (user) async {
          final userId = user.user!.uid;
          try {
            await firestore.collection("users").doc(userId).set({
              "username": nameController.text.trim(),
              "userid": userId,
              "email": emailController.text.trim(),
              "course": selectedCourse!.toLowerCase().replaceAll(" ", ""),
              "semester": selectedSemester,
              "usertype": "user",
            });
          } catch (e) {
            showErrorMessage(e.toString(), context);
          }
        },
      );
      messengerKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text("Sucess"),
          backgroundColor: Colors.blue,
        ),
      );
      navigatorKey.currentState!.pop();
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      showErrorMessage(e.code, context);
    }
  }

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
                    hidePassword: false,
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

                  //Select Course and Semester
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        //Select Course DropDown
                        child: DropdownButtonFormField(
                          value: selectedCourse,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please select course";

                              // if user has selected 'Select Course' option
                            } else if (value == "Select Course") {
                              return "Please select course";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.workspace_premium),
                          ),
                          onChanged: (value) {
                            setState(() {
                              //take value as the selected course
                              selectedCourse = value;
                            });
                          },
                          items: coursesList //list of courses go here
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        //Select Semester dropdown
                        child: DropdownButtonFormField(
                          //check if user has selected any semester
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your semester";
                            } else if (value == "Sem") {
                              return "Pick semester";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          decoration: const InputDecoration(
                            icon: Icon(Icons.view_timeline_rounded),
                          ),
                          value: selectedSemester,
                          onChanged: (value) {
                            setState(() {
                              selectedSemester =
                                  value; //set the value as selected semester
                            });
                          },
                          items: semesterList.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  //Email input field
                  CustomTextField(
                    hidePassword: false,
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
                    hidePassword: true,
                    suffixIcon: Icons.remove_red_eye_rounded,
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
                    hidePassword: true,
                    suffixIcon: Icons.remove_red_eye_rounded,
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        );

                        createUserEmailPassword(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                    child: const SubmitButton(buttonText: "Signup"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Naviate to login page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Joined us before?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: widget.onTap,
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
