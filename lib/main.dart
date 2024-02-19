import 'package:expense/providers/user_provider.dart';
import 'package:expense/screens/homeScreen.dart';
import 'package:expense/screens/loginPage.dart';
import 'package:expense/screens/registerPage.dart';
import 'package:expense/screens/welcomePage.dart';
import 'package:expense/services/auth_services.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Node Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context).user.token!.isEmpty
          ? const WelcomePage()
          : const HomeScreen(),
      routes: {
        '/login': (context) => LoginPage(), // Add this line
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
