import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_crud/features/products/data/datasourses/product_remote_data_source.dart';
import 'package:todo_crud/features/products/presentation/controllers/product_form_controller.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/porduct_repository.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_product_by_id.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/update_product.dart';
import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // Dio Client

    Get.lazyPut<Dio>(() => DioClient().dio);

    // Product  Data Source

    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSource(Get.find<Dio>()),
    );

    // Repository

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(Get.find<ProductRemoteDataSource>()),
    );

    // Use cases

    Get.lazyPut<GetProducts>(() => GetProducts(Get.find<ProductRepository>()));
    Get.lazyPut<GetProductById>(
      () => GetProductById(Get.find<ProductRepository>()),
    );
    Get.lazyPut<CreateProduct>(
      () => CreateProduct(Get.find<ProductRepository>()),
    );
    Get.lazyPut<UpdateProduct>(
      () => UpdateProduct(Get.find<ProductRepository>()),
    );

    //controller

    Get.lazyPut<ProductController>(
      () => ProductController(
        getProduct: GetProducts(Get.find<ProductRepository>()),
        getProductById: GetProductById(Get.find<ProductRepository>()),
        createProduct: CreateProduct(Get.find<ProductRepository>()),
        updateProduct: UpdateProduct(Get.find<ProductRepository>()),
        deleteProduct: DeleteProduct(Get.find<ProductRepository>()),
      ),
    );
    Get.lazyPut(
      () => ProductFormController(
        createProduct: CreateProduct(Get.find<ProductRepository>()),
        updateProduct: UpdateProduct(Get.find<ProductRepository>()),
      ),
    );
  }
}
