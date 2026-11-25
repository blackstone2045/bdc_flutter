import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/entites/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            if (product.image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

                child: Image.network(
                  ApiConstants.getProductImageUrl(product.image),

                  width: double.infinity,
                  height: 250,

                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text('Product ID: ${product.id}'),

            Text('Price: \$${product.price}'),

            Text('Stock: ${product.stock}'),

            Text('Created: ${product.createdAt?.toLocal() ?? 'N/A'}'),

            Text('Updated: ${product.updatedAt?.toLocal() ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
