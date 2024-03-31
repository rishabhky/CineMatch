import 'package:expense/screens/example_candidate_model.dart';
import 'package:expense/screens/example_card.dart';
import 'package:expense/screens/friends.dart';
import 'package:expense/screens/mainScreen.dart';
import 'package:expense/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late int _selectedIndex;
  AuthService authService = AuthService();
  late TabController _tabController;
  final keyArrow = GlobalKey();

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedScreen(int index) {
    if (index == 0) {
      return MainScreen();
    } else if (index == 1) {
      return FriendsPage();
    }
    return Container();
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
      body: _getSelectedScreen(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: SizedBox(
          width: double.infinity,
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            tabs: [
              GButton(
                icon: Icons.home,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
