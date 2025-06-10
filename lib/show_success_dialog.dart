import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home_screen.dart';

showSuccessDaialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Success"),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              ),
            );
          },
          child: const Text(
            "Close",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
