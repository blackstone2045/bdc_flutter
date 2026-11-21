import 'package:dio/dio.dart';
import 'package:todo_crud/features/products/domain/entites/product.dart';
import 'package:todo_crud/features/products/domain/entites/product_page.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/api_exception.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource.Product(this.dio);

  // GET ALL TASKS

  Future<ProductPage> getProducts({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await dio.get(
        ApiConstants.products,
        queryParameters: {'page': page, 'limit': limit},
      );

      final data = response.data;

      final List<dynamic> productList = data['data'];

      final meta = data['meta'];

      return ProductPage(
        products: productList
            .map(
              (json) => ProductModel.fromJson(Map<String, dynamic>.from(json)),
            )
            .toList(),
        page: meta['page'],
        limit: meta['limit'],
        total: meta['total'],
        totalPage: meta['totalPage'],
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // GET TASK BY ID

  Future<ProductModel> getTaskById(String id) async {
    try {
      final response = await dio.get('${ApiConstants.tasks}/$id');

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // CREATE TASK

  Future<ProductModel> createTask(TaskRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.tasks,
        data: {
          'title': request.title,
          'description': request.description,
          'status': request.status,
        },
      );

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // UPDATE TASK

  Future<ProductModel> updateTask(String id, TaskRequest request) async {
    try {
      final response = await dio.patch(
        '${ApiConstants.tasks}/$id',
        data: {
          'title': request.title,
          'description': request.description,
          'status': request.status,
        },
      );

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // DELETE TASK

  Future<ProductModel> deleteTask(String id) async {
    try {
      final response = await dio.delete('${ApiConstants.tasks}/$id');

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
