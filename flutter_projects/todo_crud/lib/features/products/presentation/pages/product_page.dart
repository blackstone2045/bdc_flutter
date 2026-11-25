import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_crud/features/products/domain/entites/product.dart';

import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/update_product.dart';
import '../controllers/product_controller.dart';
import '../controllers/product_form_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/product_form_dialoge.dart';
import 'product_details_page.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  Future<void> openCreateProductDialog() async {
    Get.put(
      ProductFormController(
        createProduct: Get.find<CreateProduct>(),
        updateProduct: Get.find<UpdateProduct>(),
      ),
    );

    try {
      final result = await Get.dialog<bool>(const ProductFormDialog());

      if (result == true) {
        await Get.find<ProductController>().fetchProducts();
      }
    } finally {
      if (Get.isRegistered<ProductFormController>()) {
        Get.delete<ProductFormController>();
      }
    }
  }

  Future<void> openEditProductDialog(Product product) async {
    Get.put(
      ProductFormController(
        createProduct: Get.find<CreateProduct>(),
        updateProduct: Get.find<UpdateProduct>(),
        product: product,
      ),
    );

    try {
      final result = await Get.dialog<bool>(const ProductFormDialog());

      if (result == true) {
        await Get.find<ProductController>().fetchProducts();
      }
    } finally {
      if (Get.isRegistered<ProductFormController>()) {
        Get.delete<ProductFormController>();
      }
    }
  }

  Future<void> openDetails(String id) async {
    final product = await controller.fetchProductById(id);

    if (product == null) return;

    Get.to(() => ProductDetailsPage(product: product));
  }

  void confirmDelete(String id) {
    Get.defaultDialog(
      title: 'Delete Product',

      middleText: 'Are you sure you want to delete this product?',

      textCancel: 'Cancel',

      textConfirm: 'Delete',

      confirmTextColor: Colors.white,

      onConfirm: () {
        Get.back();

        controller.removeProduct(id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Management'),

        actions: [
          IconButton(
            onPressed: () {
              controller.fetchProducts(refresh: true);
            },

            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openCreateProductDialog,

        child: const Icon(Icons.add),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty &&
            controller.foundProducts.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(controller.errorMessage.value),

                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: () {
                    controller.fetchProducts(refresh: true);
                  },

                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.foundProducts.isEmpty) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    controller.searchProducts(value);
                    // if (controller.foundProducts.isEmpty) {
                    //   controller.fetchProducts(refresh: true);
                    // }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search Product..',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Center(child: Text('No products available')),
              ElevatedButton(
                onPressed: () {
                  controller.fetchProducts(refresh: true);
                },

                child: const Text('Retry'),
              ),
            ],
          );
        }

        return RefreshIndicator(
          onRefresh: () {
            return controller.fetchProducts(refresh: true);
          },

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    controller.searchProducts(value);
                    // if (controller.foundProducts.isEmpty) {
                    //   controller.fetchProducts(refresh: true);
                    // }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search Product..',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),

                  itemCount: controller.foundProducts.length + 1,

                  itemBuilder: (context, index) {
                    if (index == controller.foundProducts.length) {
                      if (!controller.hasMore) {
                        return const SizedBox(height: 80);
                      }

                      return Padding(
                        padding: const EdgeInsets.all(16),

                        child: Center(
                          child: ElevatedButton(
                            onPressed: controller.isLoadingMore.value
                                ? null
                                : controller.loadMoreProducts,

                            child: controller.isLoadingMore.value
                                ? const CircularProgressIndicator()
                                : const Text('Load More'),
                          ),
                        ),
                      );
                    }

                    final product = controller.foundProducts[index];

                    return ProductCard(
                      product: product,

                      onDetails: () {
                        openDetails(product.id);
                      },

                      onEdit: () {
                        openEditProductDialog(product);
                      },

                      onDelete: () {
                        confirmDelete(product.id);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
