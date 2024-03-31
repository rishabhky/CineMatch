import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:expense/screens/example_card.dart';
import 'package:expense/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense/screens/example_candidate_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
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
    return Padding(
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
    );
  }
}
