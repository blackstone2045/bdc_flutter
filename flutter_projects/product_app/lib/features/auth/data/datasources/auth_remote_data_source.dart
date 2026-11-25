import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      ApiConstants.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    return AuthResponseModel.fromJson(
      response.data['data'],
    );
  }

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthResponseModel.fromJson(
      response.data['data'],
    );
  }

  Future<UserModel> getCurrentUser() async {
    final response = await dio.get(
      ApiConstants.me,
    );

    return UserModel.fromJson(
      response.data['data'],
    );
  }
}
