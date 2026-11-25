import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_crud/core/constants/api_constants.dart';

import '../controllers/product_form_controller.dart';

class ProductFormDialog extends GetView<ProductFormController> {
  const ProductFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(controller.isEditMode ? 'Update Product' : 'Create Product'),

      content: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product image
              Obx(() {
                final image = controller.selectedImage.value;

                return GestureDetector(
                  onTap: controller.pickImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: image != null
                        ? Image.file(File(image.path), fit: BoxFit.cover)
                        : controller.isEditMode &&
                              controller.product!.image.isNotEmpty
                        ? Image.network(
                            ApiConstants.getProductImageUrl(
                              controller.product!.image,
                            ),
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Icon(Icons.add_a_photo, size: 40),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 16),

              // Product name
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                validator: controller.validateName,
              ),

              const SizedBox(height: 12),

              // Product price
              TextFormField(
                controller: controller.priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                validator: controller.validatePrice,
              ),

              const SizedBox(height: 12),

              // Product stock
              TextFormField(
                controller: controller.stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  border: OutlineInputBorder(),
                ),
                validator: controller.validateStock,
              ),

              const SizedBox(height: 12),

              // Error message
              Obx(() {
                if (controller.errorMessage.value.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                );
              }),
            ],
          ),
        ),
      ),

      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),

        Obx(() {
          return ElevatedButton(
            onPressed: controller.isSubmitting.value ? null : controller.submit,
            child: controller.isSubmitting.value
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(controller.isEditMode ? 'Update' : 'Create'),
          );
        }),
      ],
    );
  }
}
