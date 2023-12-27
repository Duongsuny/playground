import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:playground/components/nav_bar.dart';
import 'package:playground/pages/cart.dart';
import 'package:playground/pages/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [const Shop(), const Cart()];
  int page = 0;
  void onTabChange(value) {
    setState(() {
      page = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: pages[page],
      bottomNavigationBar: NavBar(onTabChange: (value) => onTabChange(value)),
      appBar: AppBar(
        title: const Text("Nike", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
