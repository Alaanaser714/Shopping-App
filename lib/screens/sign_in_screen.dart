import 'package:flutter/material.dart';
import 'package:shopping_app/show_success_dialog.dart';

import '../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff686ED3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff686ED3),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Sign in to ShopCraft",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: "Email",
                  hint: "Enter your email",
                  icon: Icons.email,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!value.contains("@")) {
                      return "Email must contain '@'";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Password",
                  hint: "Enter your password",
                  icon: Icons.lock,
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      showSuccessDaialog(
                        context,
                        "Account successfully signed in!",
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff686ED3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
