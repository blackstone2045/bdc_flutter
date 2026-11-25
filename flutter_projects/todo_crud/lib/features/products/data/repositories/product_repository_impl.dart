import '../../domain/entites/product.dart';
import '../../domain/entites/product_page.dart';
import '../../domain/entites/product_request.dart';
import '../../domain/repositories/porduct_repository.dart';
import '../datasourses/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProductPage> getProducts({required int page, required int limit}) {
    return remoteDataSource.getProducts(page: page, limit: limit);
  }

  @override
  Future<Product> getProductById(String id) {
    return remoteDataSource.getProductById(id);
  }

  @override
  Future<Product> createProduct(ProductRequest request) {
    return remoteDataSource.createProduct(request);
  }

  @override
  Future<Product> updateProduct(String id, ProductRequest request) {
    return remoteDataSource.updateProduct(id, request);
  }

  @override
  Future<Product> deleteProduct(String id) {
    return remoteDataSource.deleteProduct(id);
  }
}
