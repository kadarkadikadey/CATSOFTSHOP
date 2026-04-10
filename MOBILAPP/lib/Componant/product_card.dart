import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int views;
  final int likes;
  final VoidCallback? onShare;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.views,
    required this.likes,
    this.onShare,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the system is in Dark Mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          // USE IT HERE: Dark grey for dark mode, white for light mode
          color: isDarkMode ? Colors.grey[900] : Colors.white,

          borderRadius: BorderRadius.circular(20),

          // USE IT HERE: Lighter border for dark mode so it stands out
          border: Border.all(
            color: isDarkMode ? Colors.white10 : Colors.black.withOpacity(0.08),
            width: 1.0,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  child: const Icon(Icons.broken_image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      // Removed 'const' because isDarkMode is dynamic
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      // USE IT HERE: White text for dark mode, Dark Blue for light mode
                      color: isDarkMode
                          ? Colors.white
                          : const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(
                    thickness: 0.5,
                    color: isDarkMode ? Colors.white24 : Colors.grey[300],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildStat(
                        Icons.visibility_outlined,
                        views.toString(),
                        isDarkMode,
                      ),
                      const SizedBox(width: 20),
                      _buildStat(
                        Icons.favorite_border,
                        likes.toString(),
                        isDarkMode,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        color: isDarkMode ? Colors.white70 : Colors.blueGrey,
                        onPressed: onShare,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Update your helper method to accept isDarkMode
Widget _buildStat(IconData icon, String label, bool isDarkMode) {
  return Row(
    children: [
      Icon(
        icon,
        size: 18,
        color: isDarkMode ? Colors.white60 : Colors.blueGrey[400],
      ),
      const SizedBox(width: 5),
      Text(
        label,
        style: TextStyle(
          color: isDarkMode ? Colors.white60 : Colors.blueGrey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
