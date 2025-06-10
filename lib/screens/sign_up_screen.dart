import 'package:easy_localization/easy_localization.dart';
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
        title: Text(
          tr('sign_up').tr(),
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
                Text(
                  tr('create_account').tr(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff686ED3),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tr('join').tr(),
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),

                CustomTextField(
                  label: tr('full_name').tr(),
                  hint: tr('enter_full_name').tr(),
                  icon: Icons.person,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return tr("please_enter_full_name").tr();
                    }
                    if (!RegExp(r'^[A-Z]').hasMatch(value.trim())) {
                      return tr("first_letter").tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                CustomTextField(
                  label: tr('email').tr(),
                  hint: tr('enter_email').tr(

                  ),
                  icon: Icons.email,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return tr("please_enter_email").tr();
                    }
                    if (!value.contains("@")) {
                      return tr("email_format").tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                CustomTextField(
                  label: tr('password').tr(),
                  hint: tr('enter_password').tr(),
                  icon: Icons.lock,
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return tr("password_length").tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                CustomTextField(
                  label: tr('confirm_password').tr(),
                  hint: tr('confirm_password_hint').tr(),
                  icon: Icons.lock,
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return tr("passwords_mismatch").tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      showSuccessDaialog(context, tr('account_created').tr());
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
                    child: Text(
                      tr('create_account').tr(),
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
