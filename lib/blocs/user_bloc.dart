
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_bloc/models/authenticate_user_model.dart';
import 'package:shopping_bloc/models/create_user_model.dart';
import 'package:shopping_bloc/models/user_model.dart';
import 'package:shopping_bloc/repositories/account_repository.dart';
import 'package:shopping_bloc/settings/settings.dart';

class UserBloc extends ChangeNotifier {
  UserModel? user = UserModel();

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel?> authenticate(AuthenticateUserModel model) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      AccountRepository repository = AccountRepository();
      UserModel response = await repository.authenticate(model);

      user = response;

      await preferences.setString('user', jsonEncode(response));

      return response;
    } catch (e) {
      user = null;
      return null;
    }
  }

  Future<UserModel?> create(CreateUserModel model) async {
    try {
      AccountRepository repository = AccountRepository();
      UserModel response = await repository.create(model);
      return response;
    } catch (e) {
      user = null;
      return null;
    }
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('user');
    await preferences.clear();
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userData = preferences.getString('user');
    if (userData != null) {
      UserModel response = UserModel.fromJson(jsonDecode(userData));
      Settings.user = response;
      user = response;
    }
  }
}