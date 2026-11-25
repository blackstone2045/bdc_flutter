import 'package:todo_crud/features/products/domain/entites/product.dart';

import '../repositories/porduct_repository.dart';

class GetProductById {
  final ProductRepository repository;

  GetProductById(this.repository);

  Future<Product> call(String id) {
    return repository.getProductById(id);
  }
}
