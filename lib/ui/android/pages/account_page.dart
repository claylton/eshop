import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user_bloc.dart';
import 'package:shopping_bloc/ui/android/pages/settings_page.dart';
import 'package:shopping_bloc/ui/shared/widgets/account/authenticated_user_card_widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/account/unauthenticated_user_card_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = Provider.of<UserBloc>(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              child: const Icon(Icons.settings_suggest_sharp, color: Colors.white),
            )
          ],
        ),
        body: bloc.user == null ? const UnauthenticatedUserCardWidget() : const AuthenticatedUserCardWidget());
  }
}
