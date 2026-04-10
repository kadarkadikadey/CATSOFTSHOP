import 'package:cat_soft_shop/LoginScreen/login_or_signup.dart';
import 'package:flutter/material.dart';

class Leadingscreen extends StatefulWidget {
  const Leadingscreen({super.key});

  @override
  _LeadingscreenState createState() => _LeadingscreenState();
}

class _LeadingscreenState extends State<Leadingscreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> landingData = [
    {
      "title": "Welcome to CatSoftShop",
      "subtitle":
          "Access thousands of high-quality scripts, themes, and software at your fingertips.",
      "image": "https://tse2.mm.bing.net/th/id/OIP.gJA4W-14pG2Xbl1fG_ZHAwHaE8?rs=1&pid=ImgDetMain&o=7&rm=3",
    },
    {
      "title": "Instant Delivery",
      "subtitle":
          "No waiting. Purchase and download your digital products immediately after checkout",
      "image": "https://tse4.mm.bing.net/th/id/OIP.t4-Rb5eg9QC2J64vyEjgpAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
    },
    {
      "title": "Secure Licensing",
      "subtitle":
          "Every purchase comes with verified licenses and 24/7 technical support for your peace of mind.",
      "image": "https://th.bing.com/th/id/OIP.KbzIYF2BxCO76jZ1BS6lfwHaEK?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Swipable Content
          PageView.builder(
            controller: _controller,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemCount: landingData.length,
            itemBuilder: (context, index) => LandingContent(
              title: landingData[index]["title"]!,
              subtitle: landingData[index]["subtitle"]!,
              image: landingData[index]["image"]!,
            ),
          ),

          // 2. Bottom Navigation UI
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Page Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    landingData.length,
                    (index) => buildDot(index),
                  ),
                ),
                const SizedBox(height: 40),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == landingData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginOrSignup(),
                          ),
                        ); // Navigate to Login/Home
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      _currentPage == landingData.length - 1
                          ? "GET STARTED"
                          : "NEXT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build the dots
  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class LandingContent extends StatelessWidget {
  final String title, subtitle, image;
  const LandingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // FIX: Use Image.network to display the image from the URL
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
              // Optional: Show a loading spinner while the image loads
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 250,
                  width: 250,
                  color: Colors.blue[50],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              // Optional: Show an error icon if the link is broken
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                width: 250,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, size: 50),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
