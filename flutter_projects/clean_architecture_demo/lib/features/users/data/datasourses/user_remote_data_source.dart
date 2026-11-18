import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;
  UserRemoteDataSource(this.dio);

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get(ApiConstants.users);
      final List data = response.data;

      return data.map((json) => UserModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Something went wrong');
    }
  }
}
