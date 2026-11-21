class Product {
  final String id;
  final String name;
 final String image;
  final double price;
  final int stock;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Product({ required this.id, required this.name, required this.price, required this.stock, this.createdAt, this.updatedAt, required this.image,});
}
