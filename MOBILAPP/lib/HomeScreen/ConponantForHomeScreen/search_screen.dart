import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/HomeShopwAllProductSystem/ShowDetailOfProduct/show_detail_of_product.dart';
import 'package:flutter/material.dart';
import 'package:cat_soft_shop/fackdata.dart'; // Your data file
import 'package:cat_soft_shop/Componant/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // This list will hold the products that match the search
  List<ProductModel> filteredProducts = [];
  
  // Controller to clear the text field
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initially, show nothing or show all products
    filteredProducts = []; 
  }

  void _runFilter(String enteredKeyword) {
    List<ProductModel> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, clear results (or show all)
      results = [];
    } else {
      // Filter by Title OR Author Name (Case Insensitive)
      results = myProducts
          .where((product) =>
              product.title.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              product.authorName.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      filteredProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
            hintText: 'Search products or authors...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: const Icon(Icons.search, color: Color(0xFF0F172A)),
            suffixIcon: _searchController.text.isNotEmpty 
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _runFilter('');
                  },
                )
              : null,
          ),
        ),
      ),
      body: filteredProducts.isEmpty && _searchController.text.isNotEmpty
          ? _buildNotFound()
          : filteredProducts.isEmpty && _searchController.text.isEmpty
              ? _buildInitialState()
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final item = filteredProducts[index];
                    return ProductCard(
                      title: item.title,
                      imageUrl: item.imageUrl0,
                      views: item.views,
                      likes: item.likes,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowDetailOfProduct(product: item),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }

  // UI when nothing has been typed yet
  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_rounded, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 10),
          Text("Search for your favorite assets", 
               style: TextStyle(color: Colors.grey[500], fontSize: 16)),
        ],
      ),
    );
  }

  // UI when search returns 0 results
  Widget _buildNotFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 10),
          const Text("No products or authors found", 
               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Text("Try a different keyword"),
        ],
      ),
    );
  }
}