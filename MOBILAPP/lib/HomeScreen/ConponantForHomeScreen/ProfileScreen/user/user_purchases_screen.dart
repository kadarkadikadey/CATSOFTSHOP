import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/HomeShopwAllProductSystem/ShowDetailOfProduct/show_detail_of_product.dart';
import 'package:flutter/material.dart';
import 'package:cat_soft_shop/fackdata.dart';

class UserPurchasesScreen extends StatelessWidget {
  const UserPurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("My Purchases"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: purchasedProducts.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: purchasedProducts.length,
              itemBuilder: (context, index) {
                final product = purchasedProducts[index];
                return _buildPurchaseCard(context, product);
              },
            ),
    );
  }

  Widget _buildPurchaseCard(BuildContext context, ProductModel product) {
    return InkWell(
      onTap: () {
        // Navigate to the detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowDetailOfProduct(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl0,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "By ${product.authorName}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Purchased on Mar 2026",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Download Button
            IconButton(
              onPressed: () {
                // Simulate download logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Downloading asset...")),
                );
              },
              icon: const Icon(
                Icons.file_download_outlined,
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 15),
          const Text(
            "No purchases yet",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text("Items you buy will appear here."),
        ],
      ),
    );
  }
}
