import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/HomeShopwAllProductSystem/ShowDetailOfProduct/show_detail_of_product.dart';
import 'package:flutter/material.dart';
import 'package:cat_soft_shop/fackdata.dart';
import 'package:cat_soft_shop/Componant/product_card.dart';

class SellerProfileScreen extends StatelessWidget {
  final String sellerName;

  const SellerProfileScreen({super.key, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    // FILTER: Get only products belonging to this seller
    final sellerProducts = myProducts.where((p) => p.authorName == sellerName).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("Seller Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Seller Header Card
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      sellerName[0], // Show first letter of name
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    sellerName,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Professional Digital Creator",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStat("Products", sellerProducts.length.toString()),
                      const SizedBox(width: 40),
                      _buildStat("Rating", "4.9/5"),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Assets",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // 2. List of Seller's Products
            ListView.builder(
              shrinkWrap: true, // Crucial inside SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sellerProducts.length,
              itemBuilder: (context, index) {
                final product = sellerProducts[index];
                return ProductCard(
                  title: product.title,
                  imageUrl: product.imageUrl0,
                  views: product.views,
                  likes: product.likes,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetailOfProduct(product: product),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}