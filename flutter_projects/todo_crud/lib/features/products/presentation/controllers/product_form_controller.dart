import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entites/product.dart';
import '../../domain/entites/product_request.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/update_product.dart';

class ProductFormController extends GetxController {
  ProductFormController({
    required this.createProduct,
    required this.updateProduct,
    this.product,
  });

  final CreateProduct createProduct;
  final UpdateProduct updateProduct;
  final Product? product;

  // Form state
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();

  // Reactive state
  final isSubmitting = false.obs;
  final selectedImage = Rxn<XFile>();
  final errorMessage = ''.obs;

  final ImagePicker _imagePicker = ImagePicker();

  bool get isEditMode => product != null;

  @override
  void onInit() {
    super.onInit();

    if (isEditMode) {
      nameController.text = product!.name;
      priceController.text = product!.price.toString();
      stockController.text = product!.stock.toString();
    }
  }

  // Image selection
  Future<void> pickImage() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final extension = image.path.split('.').last.toLowerCase();

      const allowedExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

      if (!allowedExtensions.contains(extension)) {
        errorMessage.value = 'Unsupported image format.';
        return;
      }

      final fileSize = await image.length();

      if (fileSize > 2 * 1024 * 1024) {
        errorMessage.value = 'Image must be smaller than 2 MB.';
        return;
      }

      errorMessage.value = '';
      selectedImage.value = image;
    } catch (e) {
      errorMessage.value = 'Unable to select image.';
    }
  }

  // Name validation
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product name is required';
    }

    return null;
  }

  // Price validation
  String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }

    final price = double.tryParse(value);

    if (price == null || price < 0) {
      return 'Enter a valid price';
    }

    return null;
  }

  // Stock validation
  String? validateStock(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Stock is required';
    }

    final stock = int.tryParse(value);

    if (stock == null || stock < 0) {
      return 'Enter a valid stock quantity';
    }

    return null;
  }

  // Submit form
  Future<void> submit() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    // Image is required when creating a product.
    if (!isEditMode && selectedImage.value == null) {
      errorMessage.value = 'Please select a product image.';
      return;
    }

    isSubmitting.value = true;
    errorMessage.value = '';

    try {
      final request = ProductRequest(
        name: nameController.text.trim(),
        price: double.parse(priceController.text.trim()),
        stock: int.parse(stockController.text.trim()),
        imagePath: selectedImage.value?.path,
      );

      if (isEditMode) {
        await updateProduct(product!.id, request);
      } else {
        await createProduct(request);
      }

      Get.back(result: true);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isSubmitting.value = false;
    }
  }

  // Dispose resources
  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    stockController.dispose();

    super.onClose();
  }
}
