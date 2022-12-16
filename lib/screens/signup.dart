import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertest/screens/login.dart';

import '../widget/PasswordField.dart';
import '../widget/PrimaryButton.dart';
import '../widget/costumtextfield.dart';

class signup extends StatefulWidget {
  static String routeName = "/signup";
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
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
                        labelText: "First Name",
                        hintText: "Enter your first name",
                        controller: firstname,
                        textInputType: TextInputType.text),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Last Name",
                        hintText: "Enter your last name",
                        controller: lastname,
                        textInputType: TextInputType.text),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Address",
                        hintText: "Enter your current address",
                        controller: address,
                        textInputType: TextInputType.text),
                    const SizedBox(
                      height: 20.0,
                    ),
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
                    PasswordField(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Confirm Password",
                        hintText: "Enter again your password",
                        controller: confirmpasswordcontroller),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                        text: "Login",
                        iconData: Icons.login,
                        onPress: () {
                          Navigator.pushNamed(context, login.routeName);
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, login.routeName);
                        },
                        child: Text("Already have an account?",
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
}
