import 'package:cat_soft_shop/LoginScreen/LoginPage/login_screen.dart';
import 'package:cat_soft_shop/LoginScreen/SignupPage/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
  
  return DefaultTabController(
      length: 2, // Two tabs: Signup and Login
      initialIndex: 1, // Start on Login (Right side)
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CatSoftShop"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "SIGN UP"),
                Tab(text: "LOGIN"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            SignupScreen(), // Left side
            LoginScreen(),  // Right side
          ],
        ),
      ),
    );
  }
}