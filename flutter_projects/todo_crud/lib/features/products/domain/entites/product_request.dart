class ProductRequest {
  final String? name;
  final double? price;
  final int? stock;
  final String? imagePath;

  const ProductRequest({
    required this.name,
    required this.price,
    required this.stock,
    required this.imagePath,
  });
}
