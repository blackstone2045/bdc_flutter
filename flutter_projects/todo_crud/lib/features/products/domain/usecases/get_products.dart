import 'package:todo_crud/features/products/domain/entites/product_page.dart';
import 'package:todo_crud/features/products/domain/repositories/porduct_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<ProductPage> call({
    required int page,
    required int limit,
  }) {
    return repository.getProducts(
      page: page,
      limit: limit,
    );
  }
}
