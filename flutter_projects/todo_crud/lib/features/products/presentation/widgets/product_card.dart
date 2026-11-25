import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/entites/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  final VoidCallback onDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onDetails,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          AspectRatio(
            aspectRatio: 16 / 9,

            child: product.image.isEmpty
                ? const Center(child: Icon(Icons.image_not_supported, size: 50))
                : Image.network(
                    ApiConstants.getProductImageUrl(product.image),

                    fit: BoxFit.cover,

                    errorBuilder: (_, __, ___) {
                      return const Center(
                        child: Icon(Icons.broken_image, size: 50),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text('Price: \$${product.price.toStringAsFixed(2)}'),

                Text('Stock: ${product.stock}'),

                const Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    IconButton(
                      onPressed: onDetails,
                      icon: const Icon(Icons.visibility),
                    ),

                    IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),

                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
