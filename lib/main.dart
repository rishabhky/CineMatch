import 'package:expense/providers/user_provider.dart';
import 'package:expense/screens/homeScreen.dart';
import 'package:expense/screens/loginPage.dart';
import 'package:expense/screens/registerPage.dart';
import 'package:expense/screens/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineMatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          return Provider.of<UserProvider>(context).user.token!.isEmpty
              ? const WelcomePage()
              : const HomeScreen();
        },
      ),
      routes: {
        '/login': (context) => const LoginPage(), // Add this line
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
