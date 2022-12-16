import 'package:flutter/material.dart';
import 'package:fluttertest/screens/settings.dart';

class dashboard extends StatefulWidget {
  static String routeName = "/dashboard";
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, settings.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.settings,
                  size: 30,
                ),
              ))
        ],
      ),
      body: Center(child: Text("Dashboard")),
    );
  }
}
