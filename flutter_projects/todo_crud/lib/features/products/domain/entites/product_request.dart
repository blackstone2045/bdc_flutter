import 'package:flutter/material.dart';

class ProductRequest {
  final String name;
  final double price;
  final int stock;
  final Image image;

  const ProductRequest({

  required this.name, required this.price, required this.stock, required this.image,});
}
