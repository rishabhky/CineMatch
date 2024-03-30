import 'package:expense/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;
  final AuthService authService = AuthService();

  void signUpUser() {
    authService.signUpUser(
        context: context,
        username: username!,
        email: email!,
        password: password!);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
              child: Material(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Center(
                            child: Column(children: [
                              Lottie.network(
                                  "https://lottie.host/4379579e-97af-4e28-8480-a0af2c4a2022/O06t56QPRS.json",
                                  fit: BoxFit.cover,
                                  height: 380,
                                  width: 380),
                              Text(
                                "REGISTER",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.grey.shade800,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text("Welcome to the community !",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(
                                height: 28,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Form(
                                    key: globalFormKey,
                                    child: Column(children: [
                                      FormHelper.inputFieldWidget(
                                          context, "username", "Username",
                                          (onValidateVal) {
                                        if (onValidateVal.isEmpty) {
                                          return "Username can't be empty";
                                        }
                                      }, (onSavedVal) {
                                        username = onSavedVal;
                                      },
                                          borderFocusColor:
                                              Colors.grey.shade800,
                                          prefixIcon: const Icon(Icons.person),
                                          borderColor: Colors.grey.shade700,
                                          prefixIconColor: Colors.grey.shade800,
                                          hintColor: Colors.grey.shade600,
                                          hintFontSize: 16,
                                          contentPadding: 20,
                                          borderRadius: 10,
                                          showPrefixIcon: true),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      FormHelper.inputFieldWidget(
                                        context,
                                        "email",
                                        "Email",
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
                                        },
                                        (onSavedVal) {
                                          email = onSavedVal;
                                        },
                                        borderFocusColor: Colors.grey.shade800,
                                        prefixIcon: const Icon(Icons.email),
                                        borderColor: Colors.grey.shade700,
                                        prefixIconColor: Colors.grey.shade800,
                                        hintColor: Colors.grey.shade600,
                                        hintFontSize: 16,
                                        contentPadding: 20,
                                        borderRadius: 10,
                                        showPrefixIcon: true,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      FormHelper.inputFieldWidget(
                                          context, "password", "Password",
                                          (onValidateVal) {
                                        if (onValidateVal.isEmpty) {
                                          return "Enter the password !";
                                        }
                                      }, (onSavedVal) {
                                        password = onSavedVal;
                                      },
                                          borderFocusColor:
                                              Colors.grey.shade800,
                                          prefixIcon: const Icon(Icons.password),
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
                                                  : Icons.visibility))),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      FormHelper.submitButton(
                                        "Register",
                                        () {
                                          if (globalFormKey.currentState!
                                              .validate()) {
                                            globalFormKey.currentState!
                                                .save(); // Save form field values
                                            signUpUser(); // Sign up the user
                                          }
                                        },
                                        btnColor: Colors.black,
                                        width: 300,
                                        height: 60,
                                        borderRadius: 10,
                                        borderColor: Colors.black,
                                      ),
                                    ])),
                              ),
                            ]),
                          ),
                        ),
                      ))))),
    );
  }
}
