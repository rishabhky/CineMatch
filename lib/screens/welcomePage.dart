import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:expense/utills/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Lottie.asset(
                  "assets/welcome.json",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              Text("Welcome to CineMatch",
                  style: GoogleFonts.ubuntu(
                      color: Colors.grey.shade900,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                    " Discover new films tailored to your unique tastes, swipe right to like, left to pass, and let our smart recommendation system find the movies you'll love. Start swiping now and unlock a world of cinematic possibilities!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        color: Colors.grey.shade600.withOpacity(0.9),
                        fontSize: 16.0)),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(340, 60),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.loginRoute);
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(340, 60),
                      backgroundColor: Colors.grey.shade500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.regRoute);
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.ubuntu(
                        color: Colors.grey.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
