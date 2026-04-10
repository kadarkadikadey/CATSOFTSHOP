import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/HomeShopwAllProductSystem/home_show_all_product.dart';
import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/ProfileScreen/user/user_profile_screen.dart';
import 'package:cat_soft_shop/HomeScreen/ConponantForHomeScreen/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // The 3 different screens for your navigation
  static const List<Widget> _widgetOptions = <Widget>[
    HomeShowAllProduct(),
    SearchScreen(),
    UserProfileScreen(),    // Settings/User info
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CatSoftShop"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent, // Your "Soft" tech color
        onTap: _onItemTapped,
      ),
    );
  }
}
