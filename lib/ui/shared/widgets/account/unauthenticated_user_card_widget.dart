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
        SizedBox(height: 60),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text("Autentique-se"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupPage(),
              ),
            );
          },
          child: Text("Ainda não sou cadastrado"),
        )
      ],
    );
  }
}
