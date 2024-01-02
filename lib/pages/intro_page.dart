import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playground/components/button.dart';
import 'package:playground/pages/restaurant.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(248, 109, 29, 29),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text("SUSHI SHOP",
                    style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white, fontSize: 28)),
                //image
                Center(
                  child: Image.asset(
                    "lib/assets/bento.png",
                    height: 300,
                  ),
                ),
                //title
                Column(children: [
                  Text("BEHOLD OUR PRESTIGIOUS RESTAURANT IN TOWN",
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white, fontSize: 29)),
                  const SizedBox(height: 20),
                  //description
                  const Text(
                    "Where culinary artistry meets the delicate flavors of Japan. Immerse yourself in a Japanese dining experience.",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ]),
                //button
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Restaurant()));
                  },
                  child: SushiButton(text: "Discover now ", height: 60, icon: Icons.arrow_right_alt),
                  )
              ]),
        ));
  }
}
