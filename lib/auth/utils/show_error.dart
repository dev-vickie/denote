import 'package:flutter/material.dart';

void showErrorMessage(String code, BuildContext context) {
  switch (code) {
    case ("user-not-found"):
      code = "No account associated with this email\nPlease create new account";
      break;
    case ("wrong-password"):
      code = "Invalid Credentials\nPlease try again";
      break;
    case ("invalid-email"):
      code = "Invalid Credentials\nPlease try again";
      break;
    case ("user-disabled"):
      code = "No record for this user\nPlease create account";
      break;
    case ("email-already-in-use"):
      code = "Email is already registered.\nPlease Login";
      break;
    case ("too-many-requests"):
      code = "Too many requests\nPlease try after little while.";
      break;
    case ('network-request-failed'):
      code =
          "Something went wrong.\nCheck your internet connection and restart the app";
      break;
    default:
      code = "Something went wrong,please try again later";
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "ERROR!",
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),
          ),
        ),
        content: Text(
          code,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back"),
          )
        ],
      );
    },
  );
}
