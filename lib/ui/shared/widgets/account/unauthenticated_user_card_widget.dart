import 'package:flutter/material.dart';
import 'package:shopping_bloc/ui/android/pages/login_page.dart';
import 'package:shopping_bloc/ui/android/pages/signup_page.dart';

class UnauthenticatedUserCardWidget extends StatelessWidget {
  const UnauthenticatedUserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 60),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Text("Autentique-se"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupPage(),
              ),
            );
          },
          child: const Text("Ainda não sou cadastrado"),
        )
      ],
    );
  }
}
