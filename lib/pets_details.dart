import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/configuration.dart';

class PetsDetails extends StatelessWidget {
  const PetsDetails({
    Key? key,
    required this.image,
    required this.catName,
    required this.catType,
    required this.catAge,
    required this.catDistance,
  }) : super(key: key);

  final String image, catName, catType;
  final int catAge;
  final double catDistance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 240,
      child: Row(children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: shadowList,
                ),
                margin: const EdgeInsets.only(top: 40),
              ),
              Align(child: Image.asset(image))
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 60,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          catName,
                          style: GoogleFonts.rubik(
                            color: Colors.grey.shade800,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.male,
                        color: primaryGreen,
                      )
                    ],
                  ),
                  Text(
                    catType,
                    style: GoogleFonts.rubik(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "$catAge years",
                    style: GoogleFonts.rubik(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: primaryGreen,
                      ),
                      Text(
                        "Distance  $catDistance km",
                        style: GoogleFonts.rubik(
                          color: Colors.grey.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
