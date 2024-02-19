import 'package:expense/screens/example_candidate_model.dart';
import 'package:expense/screens/example_card.dart';
import 'package:expense/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
          title: Text(
            "CineMatch",
            style:
                GoogleFonts.ubuntu(color: Colors.grey.shade400, fontSize: 25),
          ),
          backgroundColor: Color.fromARGB(255, 19, 19, 19),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Builder(builder: (context) {
                return GestureDetector(
                    onTap: () {
                      authService.signOut(context);
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                        )));
              }),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Container(
          child: Center(
              child: Column(
            children: [
              Text(
                "Hello babe",
                style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 24.0),
              ),
              Expanded(
                child: AppinioSwiper(
                  cardBuilder: (BuildContext context, int index) {
                    return ExampleCard(candidate: candidates[index]);
                  },
                  cardCount: candidates.length,
                ),
              )
            ],
          )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: Container(
          width: double.infinity,
          child: GNav(
            tabs: [
              GButton(
                icon: Icons.home,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                gap: 15,
                iconActiveColor: Colors.white,
                text: 'Home',
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800.withOpacity(0.4),
              ),
              GButton(
                icon: Icons.people_sharp,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                gap: 15,
                iconActiveColor: Colors.white,
                text: 'Friends',
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
