import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/post_model.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get(
        ApiConstants.posts,
      );

      final List data = response.data;

      return data
          .map((json) => PostModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        e.message ?? 'Something went wrong',
      );
    }
  }
}