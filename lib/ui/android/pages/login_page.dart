import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/user_bloc.dart';
import 'package:shopping_bloc/models/authenticate_user_model.dart';
import 'package:shopping_bloc/ui/android/pages/account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Usuário Inválido";
                  }
                  return null;
                },
                onSaved: (value) {
                  username = value ?? '';
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Senha Inválida";
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value ?? '';
                },
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    authenticate(context);
                  }
                },
                child: const Text("Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context) {
    UserBloc bloc = Provider.of<UserBloc>(context, listen: false);

    bloc.authenticate(AuthenticateUserModel(username: username, password: password)).then((user) {
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AccountPage()));
        return;
      }
      const snackBar = SnackBar(content: Text("Usuário ou senha inválidos"));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}