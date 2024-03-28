import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:http/http.dart' as http;
import 'package:expense/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final AuthService authService = AuthService();

  void loginUser() {
    authService.signInUser(
      context: context,
      email: email!,
      password: password!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Lottie.network(
                        "https://lottie.host/4379579e-97af-4e28-8480-a0af2c4a2022/O06t56QPRS.json",
                        fit: BoxFit.cover,
                        height: 380,
                        width: 380,
                      ),
                      Text(
                        "LOGIN",
                        style: GoogleFonts.ubuntu(
                          color: Colors.grey.shade800,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Welcome Back !",
                        style: GoogleFonts.ubuntu(
                          color: Colors.grey.shade600,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Form(
                          key: globalFormKey,
                          child: Column(
                            children: [
                              FormHelper.inputFieldWidget(
                                context,
                                "email",
                                "Email",
                                (onValidateVal) {
                                  (onValidateVal) {
                                    if (onValidateVal.isEmpty) {
                                      return "Email cannot be empty";
                                    }
                                    if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(onValidateVal)) {
                                      return "Invalid email format";
                                    }
                                    return null;
                                  };
                                },
                                (onSavedVal) {
                                  email = onSavedVal;
                                },
                                borderFocusColor: Colors.grey.shade800,
                                prefixIcon: Icon(Icons.person),
                                borderColor: Colors.grey.shade700,
                                prefixIconColor: Colors.grey.shade800,
                                hintColor: Colors.grey.shade600,
                                hintFontSize: 16,
                                contentPadding: 20,
                                borderRadius: 10,
                                showPrefixIcon: true,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FormHelper.inputFieldWidget(
                                context,
                                "password",
                                "Password",
                                (onValidateVal) {
                                  if (onValidateVal.isEmpty) {
                                    return "Enter the password !";
                                  }
                                },
                                (onSavedVal) {
                                  password = onSavedVal;
                                },
                                borderFocusColor: Colors.grey.shade800,
                                prefixIcon: Icon(Icons.password),
                                borderColor: Colors.grey.shade700,
                                prefixIconColor: Colors.grey.shade800,
                                hintColor: Colors.grey.shade600,
                                hintFontSize: 16,
                                contentPadding: 20,
                                borderRadius: 10,
                                showPrefixIcon: true,
                                obscureText: hidePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Forgot Password ?",
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("Forgot Password");
                                        },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              FormHelper.submitButton(
                                "Login",
                                () {
                                  if (globalFormKey.currentState!.validate()) {}
                                  globalFormKey.currentState!.save();
                                  loginUser();
                                },
                                btnColor: Colors.black,
                                width: 300,
                                height: 60,
                                borderRadius: 10,
                                borderColor: Colors.black,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Don't have an account ? ",
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign Up",
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade600,
                                        fontSize: 17,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, "/register");
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
