import 'package:flutter/material.dart';
import 'package:test_app/configuration.dart';
import 'package:test_app/pets_details.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AnimatedContainer(
        padding: const EdgeInsets.only(bottom: 20),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: const Duration(milliseconds: 250),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 5,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                          icon: const Icon(Icons.menu),
                        ),
                  Column(
                    children: [
                      const Text("Location"),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: primaryGreen),
                          const Text("Mumbai"),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.only(left: 10),
              height: 50,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: primaryGreen.withOpacity(0.23),
                    )
                  ]),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    hintText: "Search pet to adopt ...",
                    iconColor: primaryGreen,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusColor: primaryGreen,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: Image.asset(categories[index]['iconPath']),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: primaryGreen.withOpacity(0.23),
                          ),
                        ],
                      ),
                    ),
                    Text(categories[index]['name'])
                  ]);
                },
              ),
            ),
            const PetsDetails(
              image: "images/pet-cat1.png",
              catName: "Rola",
              catType: "Abyasnas",
              catAge: 2,
              catDistance: 7.3,
            ),
            const PetsDetails(
              image: "images/pet-cat2.png",
              catName: "Solaasdasd",
              catType: "aszae",
              catAge: 4,
              catDistance: 2,
            ),
          ],
        ),
      ),
    );
  }
}
