import 'package:flutter/material.dart';
import 'package:fluttertest/screens/dashboard.dart';
import 'package:fluttertest/screens/login.dart';
import 'package:fluttertest/screens/settings.dart';
import 'package:fluttertest/screens/signup.dart';

final Map<String, WidgetBuilder> routes = {
  login.routeName: (BuildContext context) => login(),
  signup.routeName: (BuildContext context) => signup(),
  dashboard.routeName: (BuildContext context) => dashboard(),
  settings.routeName: (BuildContext context) => settings()
};
