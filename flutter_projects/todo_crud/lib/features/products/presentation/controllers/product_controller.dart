import 'package:get/get.dart';
import 'package:todo_crud/features/products/domain/entites/product.dart';
import 'package:todo_crud/features/products/domain/usecases/get_products.dart';

import '../../domain/entites/product_request.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_product_by_id.dart';
import '../../domain/usecases/update_product.dart';

class ProductController extends GetxController {
  final GetProducts getProduct;
  final GetProductById getProductById;
  final CreateProduct createProduct;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;

  ProductController({
    required this.getProduct,
    required this.getProductById,
    required this.createProduct,
    required this.updateProduct,
    required this.deleteProduct,
  });

  // Reactive variables

  final RxList<Product> products = <Product>[].obs;

  final RxBool isLoading = false.obs;

  final RxBool isSubmitting = false.obs;

  final RxBool isLoadingMore = false.obs;

  final RxString errorMessage = ''.obs;

  final Rxn<Product> selectedProduct = Rxn<Product>();
  final RxList<Product> foundProducts = <Product>[].obs;

  // Pagination

  int currentPage = 1;

  int limit = 10;

  int totalPage = 1;

  bool get hasMore => currentPage < totalPage;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
    foundProducts.value = products;
  }

  // GET ALL products

  Future<void> fetchProducts({bool refresh = false}) async {
    if (isLoading.value) return;

    if (refresh) {
      currentPage = 1;
    }

    try {
      isLoading.value = true;

      errorMessage.value = '';

      final result = await getProduct(page: currentPage, limit: limit);

      products.assignAll(result.products);

      currentPage = result.page;

      totalPage = result.totalPage;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // LOAD MORE product

  Future<void> loadMoreProducts() async {
    if (!hasMore || isLoadingMore.value || isLoading.value) {
      return;
    }

    try {
      isLoadingMore.value = true;

      final nextPage = currentPage + 1;

      final result = await getProduct(page: nextPage, limit: limit);

      products.addAll(result.products);

      currentPage = result.page;

      totalPage = result.totalPage;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingMore.value = false;
    }
  }

  // GET Product BY ID

  Future<Product?> fetchProductById(String id) async {
    try {
      final result = await getProductById(id);

      selectedProduct.value = result;

      return result;
    } catch (e) {
      Get.snackbar('Error', e.toString());

      return null;
    }
  }

  // CREATE Product

  Future<bool> addProduct(ProductRequest request) async {
    try {
      isSubmitting.value = true;

      await createProduct(request);

      Get.back();

      Get.snackbar('Success', 'Product created successfully');

      await fetchProducts(refresh: true);

      return true;
    } catch (e) {
      Get.snackbar('Error', e.toString());

      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

  // UPDATE Product

  Future<bool> editProduct(String id, ProductRequest request) async {
    try {
      isSubmitting.value = true;

      await updateProduct(id, request);

      Get.back();

      Get.snackbar('Success', 'Product updated successfully');

      await fetchProducts(refresh: true);

      return true;
    } catch (e) {
      Get.snackbar('Error', e.toString());

      return false;
    } finally {
      isSubmitting.value = false;
    }
  }

  // DELETE Product

  Future<void> removeProduct(String id) async {
    try {
      await deleteProduct(id);

      products.removeWhere((product) => product.id == id);

      Get.snackbar('Success', 'Product deleted successfully');

      // Reload current page if it became empty.
      if (products.isEmpty && currentPage > 1) {
        currentPage--;
        await fetchProducts();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // SEARCH Product
  void searchProducts(String productName) {
    List<Product> results = [];
    if (productName.isEmpty) {
      results = [];
      return;
    } else {
      results = products.where((product) {
        return product.name.toLowerCase().contains(productName.toLowerCase());
      }).toList();
    }
    foundProducts.value = results;
  }
}
