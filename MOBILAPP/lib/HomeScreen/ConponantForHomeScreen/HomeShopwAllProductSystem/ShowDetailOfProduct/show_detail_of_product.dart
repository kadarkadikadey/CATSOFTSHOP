import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/ProfileScreen/seller/seller_profile_screen.dart';
import 'package:cat_soft_shop/fackdata.dart';
import 'package:flutter/material.dart';

class ShowDetailOfProduct extends StatefulWidget {
  final ProductModel product;

  const ShowDetailOfProduct({super.key, required this.product});

  @override
  State<ShowDetailOfProduct> createState() => _ShowDetailOfProductState();
}

class _ShowDetailOfProductState extends State<ShowDetailOfProduct> {
  // Track which image is currently displayed in the large view
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    // Start with the first image
    selectedImage = widget.product.imageUrl0;
  }

  @override
  Widget build(BuildContext context) {
    // Create a list of all available images for the loop
    List<String> allImages = [
      widget.product.imageUrl0,
      widget.product.imageUrl1,
      widget.product.imageUrl2,
      widget.product.imageUrl3,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.product.title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. MAIN LARGE IMAGE
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Container(
                key: ValueKey(selectedImage),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(selectedImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // 2. THUMBNAIL ROW
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: allImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = allImages[index];
                        });
                      },
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedImage == allImages[index]
                                ? const Color(0xFF0F172A)
                                : Colors.transparent,
                            width: 3,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(allImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 3. PRODUCT INFO SECTION
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.product.price}",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SellerProfileScreen(
                                sellerName: widget.product.authorName,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.product.authorName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Extra details
                  _buildDetailRow(
                    Icons.visibility,
                    "Views",
                    widget.product.views.toString(),
                  ),
                  _buildDetailRow(
                    Icons.favorite,
                    "Likes",
                    widget.product.likes.toString(),
                  ),
                  _buildDetailRow(
                    Icons.share,
                    "Shares",
                    widget.product.shere.toString(),
                  ),
                  _buildDetailRow(
                    Icons.calendar_today,
                    "Released",
                    widget.product.createdAt,
                  ),

                  // Availability Badge
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: widget.product.isAvailable
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: widget.product.isAvailable
                            ? Colors.green
                            : Colors.red,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.product.isAvailable
                              ? Icons.check_circle
                              : Icons.cancel,
                          size: 16,
                          color: widget.product.isAvailable
                              ? Colors.green
                              : Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.product.isAvailable
                              ? "Available"
                              : "Out of Stock",
                          style: TextStyle(
                            color: widget.product.isAvailable
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          // If isAvailable is false, onPressed is null, which disables the button automatically
          onPressed: widget.product.isAvailable ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.product.isAvailable
                ? const Color(0xFF0F172A)
                : Colors.grey, // Grey color when disabled
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            widget.product.isAvailable
                ? "Purchase Asset"
                : "Currently Unavailable",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
