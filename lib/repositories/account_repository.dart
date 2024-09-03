
import 'package:dio/dio.dart';
import 'package:shopping_bloc/models/authenticate_user_model.dart';
import 'package:shopping_bloc/models/create_user_model.dart';
import 'package:shopping_bloc/models/user_model.dart';
import 'package:shopping_bloc/settings/settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(AuthenticateUserModel model) async {
    String url = "${Settings.apiUrl}/v1/account/login";
    Response response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(CreateUserModel model) async {
    String url = "${Settings.apiUrl}/v1/account";
    Response response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }

}