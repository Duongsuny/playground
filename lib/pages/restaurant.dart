import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:playground/components/button.dart";
import "package:playground/components/dish_tile.dart";
import "package:playground/model/dish.dart";
import "package:playground/pages/description.dart";

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    List<Dish> menu = [
      Dish(name: "Shrimp", price: 30, description: "Finest shrimpt, fresh out of water", url: "lib/assets/shrimp.png", star: 4),
      Dish(name: "Bento", price: 12, description: "Delicious bento", url: "lib/assets/bento.png", star: 5),
    ];
    return Scaffold(
        backgroundColor: const Color.fromARGB(245, 245, 245, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Jakarta",
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //red container
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(248, 109, 29, 29),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get 20% off",
                            style: GoogleFonts.dmSerifDisplay(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Image.asset("lib/assets/shrimp.png"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Icon(Icons.search)
                        ],
                      ))),
              const SizedBox(height: 20),
              const Text("Popular food",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(height: 10),
              SizedBox(
                height: 270,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Description(dish: menu[index])));
                          },
                          child: DishTile(dish: menu[index]
                          )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
