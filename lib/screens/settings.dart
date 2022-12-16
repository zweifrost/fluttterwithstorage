import 'package:flutter/material.dart';
import 'package:fluttertest/screens/login.dart';
import 'package:fluttertest/services/AuthService.dart';

import '../services/StorageService.dart';

class settings extends StatefulWidget {
  static String routeName = "/settings";
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  StorageService _storageService = StorageService();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          GestureDetector(
              onTap: () async {
                await _authService.logout();
                _storageService.deleteAllData();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(login.routeName, (route) => false);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.logout,
                  size: 30,
                ),
              ))
        ],
      ),
      body: Center(child: Text("Settings")),
    );
  }
}
