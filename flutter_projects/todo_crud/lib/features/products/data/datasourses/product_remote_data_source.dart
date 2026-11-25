import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/api_exception.dart';
import '../../domain/entites/product_page.dart';
import '../../domain/entites/product_request.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  // GET ALL PRODUCTS

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
        products: productList.map((json) {
          return ProductModel.fromJson(Map<String, dynamic>.from(json));
        }).toList(),
        page: (meta['page'] as num).toInt(),
        limit: (meta['limit'] as num).toInt(),
        total: (meta['total'] as num).toInt(),
        totalPage: (meta['totalPage'] as num).toInt(),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // GET PRODUCT BY ID

  Future<ProductModel> getProductById(String id) async {
    try {
      final response = await dio.get('${ApiConstants.products}/$id');

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // CREATE PRODUCT

  Future<ProductModel> createProduct(ProductRequest request) async {
    try {
      final imagePath = request.imagePath;

      if (imagePath == null || imagePath.isEmpty) {
        throw ApiException('Product image is required.');
      }

      final formData = FormData.fromMap({
        'name': request.name!,
        'price': request.price.toString(),
        'stock': request.stock.toString(),

        'image': await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
      });

      final response = await dio.post(
        ApiConstants.products,
        data: formData,
        options: Options(contentType: Headers.multipartFormDataContentType),
      );

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // UPDATE PRODUCT

  Future<ProductModel> updateProduct(String id, ProductRequest request) async {
    try {
      final Map<String, dynamic> fields = {};

      if (request.name != null) {
        fields['name'] = request.name;
      }

      if (request.price != null) {
        fields['price'] = request.price.toString();
      }

      if (request.stock != null) {
        fields['stock'] = request.stock.toString();
      }

      if (request.imagePath != null && request.imagePath!.isNotEmpty) {
        final imagePath = request.imagePath!;

        fields['image'] = await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        );
      }

      final formData = FormData.fromMap(fields);

      final response = await dio.patch(
        '${ApiConstants.products}/$id',
        data: formData,
        options: Options(contentType: Headers.multipartFormDataContentType),
      );

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // DELETE PRODUCT

  Future<ProductModel> deleteProduct(String id) async {
    try {
      final response = await dio.delete('${ApiConstants.products}/$id');

      return ProductModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
