import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in_screen.dart';
import 'package:shopping_app/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ShopCraft',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff686ED3),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              tr('hello_message').tr(),
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset("assets/images/8750985.png", width: 200, height: 200),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff686ED3),
                    ),
                  ),
                  child: Text(tr('sign_in').tr()),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff686ED3),
                    ),
                  ),
                  child: Text(tr('sign_up').tr()),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final currentLocale = context.locale;
                if (currentLocale == const Locale('en', 'US')) {
                  context.setLocale(const Locale('ar', 'EG'));
                } else {
                  context.setLocale(const Locale('en', 'US'));
                }
              },
              child: Text(
                context.locale == const Locale('en', 'US')
                    ? 'العربية'
                    : 'English',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
