import 'package:todo_crud/features/products/domain/entites/product.dart';
import 'package:todo_crud/features/products/domain/entites/product_request.dart';
import 'package:todo_crud/features/products/domain/repositories/porduct_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Product> call(
      String id,
      ProductRequest request,
      ) {
    return repository.updateProduct(id, request);
  }
}
