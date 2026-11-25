import 'package:todo_crud/features/products/domain/entites/product.dart';
import 'package:todo_crud/features/products/domain/entites/product_page.dart';

import '../entites/product_request.dart';

abstract class ProductRepository {
  Future<ProductPage> getProducts({required int page, required int limit});

  Future<Product> getProductById(String id);

  Future<Product> createProduct(ProductRequest request);

  Future<Product> updateProduct(String id, ProductRequest request);

  Future<Product> deleteProduct(String id);
}
