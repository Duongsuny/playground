import 'package:flutter/material.dart';
import 'package:playground/tabs/feed_view.dart';
import 'package:playground/tabs/gallery_view.dart';
import 'package:playground/tabs/tagged_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> tabBarView = [FeedView(), GalleryView(), TaggedView()];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(children: [Text("312"), Text("Followers")]),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    const Column(children: [Text("252"), Text("Followings")])
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Lê Quý Dương | Sciencetist", style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 10),
                const Text("facebook.com/duberlin1211", style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 20),
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.feed)),
                    Tab(icon: Icon(Icons.image)),
                    Tab(icon: Icon(Icons.tag))
                  ],
                ),
                const Expanded(child: TabBarView(children: tabBarView)),
              ]),
            )),
      ),
    );
  }
}
