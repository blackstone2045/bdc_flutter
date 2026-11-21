import 'package:todo_crud/features/products/domain/entites/product.dart';
import 'package:todo_crud/features/products/domain/entites/product_request.dart';

import '../repositories/porduct_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Future<Product> call(ProductRequest request) {
    return repository.createProduct(request);
  }
}
