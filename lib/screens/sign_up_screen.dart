import 'package:flutter/material.dart';
import 'package:shopping_app/show_success_dialog.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff686ED3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff686ED3),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Join ShopCraft today",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),

                CustomTextField(
                  label: "Full Name",
                  hint: "Enter your full name",
                  icon: Icons.person,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your full name";
                    }
                    if (!RegExp(r'^[A-Z]').hasMatch(value.trim())) {
                      return "First letter must be uppercase";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

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
                const SizedBox(height: 12),

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
                const SizedBox(height: 12),

                CustomTextField(
                  label: "Confirm Password",
                  hint: "Re-enter your password",
                  icon: Icons.lock,
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Passwords do not match";
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
                        "Account created successfully!",
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff686ED3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
