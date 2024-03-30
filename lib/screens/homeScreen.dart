import 'package:expense/screens/example_candidate_model.dart';
import 'package:expense/screens/example_card.dart';
import 'package:expense/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AuthService authService = AuthService();
  late TabController _tabController;
  final keyArrow = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
          title: Text(
            "CineMatch",
            style:
                GoogleFonts.ubuntu(color: Colors.grey.shade400, fontSize: 25),
          ),
          backgroundColor: const Color.fromARGB(255, 19, 19, 19),
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
                        child: const Icon(
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
              TabBar(
                  controller: _tabController,
                  labelColor: Colors.white70,
                  labelStyle: GoogleFonts.ubuntu(fontSize: 15),
                  indicatorColor: Colors.white60,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'Popular'),
                    Tab(text: 'Top Rated'),
                    Tab(text: 'Upcoming'),
                  ]),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    AppinioSwiper(
                      cardBuilder: (BuildContext context, int index) {
                        return ExampleCard(
                            index: 0, candidate: candidates[index]);
                      },
                      cardCount: candidates.length,
                    ),
                    AppinioSwiper(
                      cardBuilder: (BuildContext context, int index) {
                        return ExampleCard(
                            index: 1, candidate: candidates[index]);
                      },
                      cardCount: candidates.length,
                    ),
                    AppinioSwiper(
                      cardBuilder: (BuildContext context, int index) {
                        return ExampleCard(
                            index: 2, candidate: candidates[index]);
                      },
                      cardCount: candidates.length,
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: SizedBox(
          width: double.infinity,
          child: GNav(
            tabs: [
              GButton(
                icon: Icons.home,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                gap: 15,
                iconActiveColor: Colors.white,
                text: 'Home',
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.grey.shade800.withOpacity(0.4),
              ),
              GButton(
                icon: Icons.people_sharp,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
