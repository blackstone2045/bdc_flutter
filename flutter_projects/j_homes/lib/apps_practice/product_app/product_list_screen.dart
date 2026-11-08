import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  
  static const List<Map<String, String>> products = [
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/c70d15879e914e9faebed8b5e0e0329a_9366/gazelle-indoor-shoes.jpg",
      "price": "120",
      "productName": "Gazelle Indoor Shoes",
      "productdescription": "Originals",
      "colors": "2 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/9b983d5bc09a4d4aba39a8bf011869ba_9366/samba-og-shoes.jpg",
      "price": "100",
      "productName": "Samba OG Shoes",
      "productdescription": "Men's Originals",
      "colors": "30 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/b95d80fd57a4407ca73d192339f593e6_9366/samba-adv-shoes.jpg",
      "price": "100",
      "productName": "Samba ADV Shoes",
      "productdescription": "Originals",
      "colors": "7 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/ee99b4b9bde74f30a933a8bf011911ae_9366/samba-og-shoes.jpg",
      "price": "100",
      "productName": "Samba OG Shoes",
      "productdescription": "Men's Originals",
      "colors": "30 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/2345cc874f884fc0a6a8af50010537fb_9366/campus-00s-shoes.jpg",
      "price": "110",
      "productName": "Campus 00s Shoes",
      "productdescription": "Originals",
      "colors": "40 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/5038bd871d4e471381702e52ca8a53eb_9366/gazelle-indoor-shoes.jpg",
      "price": "120",
      "productName": "Gazelle Indoor Shoes",
      "productdescription": "Originals",
      "colors": "13 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/e692ef9500a046739b8d60a6cf651f26_9366/harden-volume-9-shoes.jpg",
      "price": "160",
      "productName": "Harden Volume 9 Shoes",
      "productdescription": "Basketball",
      "colors": "4 colors",
    },
    {
      "imgUrl": "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/87e3df19b05a4f05b4a2d591e245c19f_9366/gazelle-indoor-shoes.jpg",
      "price": "120",
      "productName": "Gazelle Indoor Shoes",
      "productdescription": "Originals",
      "colors": "25 colors",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Snikers'),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  //  height: 180,
                  child: Image.network(
                    product['imgUrl']!,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image, size: 48),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['productName']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['productdescription']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$${product['price']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.favorite_border, color: Colors.grey),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
