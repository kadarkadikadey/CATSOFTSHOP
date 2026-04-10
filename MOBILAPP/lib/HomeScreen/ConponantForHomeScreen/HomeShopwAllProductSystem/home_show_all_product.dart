import 'package:cat_soft_shop/Componant/product_card.dart';
import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/HomeShopwAllProductSystem/ShowDetailOfProduct/show_detail_of_product.dart';
import 'package:flutter/material.dart';
import '../../../fackdata.dart';

class HomeShowAllProduct extends StatelessWidget {
  const HomeShowAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Add some top spacing
            // This loop generates the cards automatically
            ...myProducts.map((product) {
              return ProductCard(
                title: product.title,
                // We use imageUrl0 as the main thumbnail for the card
                imageUrl: product.imageUrl0,
                views: product.views,
                likes: product.likes,
                onShare: () {},
                onTap: () {
                  // Navigate to the detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ShowDetailOfProduct(product: product),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
