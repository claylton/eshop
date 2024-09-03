import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user_bloc.dart';

class AuthenticatedUserCardWidget extends StatelessWidget {
  const AuthenticatedUserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = Provider.of<UserBloc>(context);

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(bloc.user?.image ?? ''),
              ),
              color: Theme.of(context).primaryColor,
              border: Border.all(width: 4.0, color: const Color(0xFFFFFFFF)),
              borderRadius: BorderRadius.circular(200),
            ),
          ),
          const SizedBox(height: 20),
          Text("Bem-vindo, ${bloc.user}"),
          const SizedBox(height: 10),
          TextButton(onPressed: bloc.logout(), child: const Text("Sair"))
        ],
      ),
    );
  }
}
