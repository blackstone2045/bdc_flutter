import 'package:todo_crud/features/products/domain/entites/product.dart';

import '../repositories/porduct_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Future<Product> call(String id) {
    return repository.deleteProduct(id);
  }
}
