import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertest/models/Storageitem.dart';
import 'package:fluttertest/screens/dashboard.dart';
import 'package:fluttertest/screens/signup.dart';
import 'package:fluttertest/services/AuthService.dart';
import 'package:fluttertest/services/StorageService.dart';
import 'package:fluttertest/widget/PrimaryButton.dart';
import 'package:fluttertest/widget/costumtextfield.dart';
import 'package:fluttertest/widget/passwordfield.dart';

class login extends StatefulWidget {
  static String routeName = "/login";
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  StorageService _storageService = StorageService();
  AuthService _authService = AuthService();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "Email Addesss",
                        hintText: "Enter your email address",
                        controller: emailcontroller,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Password",
                        hintText: "Enter your password",
                        controller: passwordcontroller),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                        text: "Login",
                        iconData: Icons.login,
                        onPress: () {
                          loginWithProvider();
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, signup.routeName);
                        },
                        child: Text("Sign up now!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  loginWithProvider() async {
    try {
      var user = await _authService.signInWithGoogle();
      var accesstoken =
          StorageItem("accessToken", user.credential?.accessToken as String);
      await _storageService.savedata(accesstoken);
      Navigator.pushReplacementNamed(context, dashboard.routeName);
    } catch (e) {}
  }
}
