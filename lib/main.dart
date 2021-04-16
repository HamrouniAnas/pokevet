import 'package:flutter/material.dart';
import 'package:pokevet_flutter/screens/home.dart';
import 'package:pokevet_flutter/screens/loading_screen.dart';
import 'package:pokevet_flutter/screens/login.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/login': (context) => Login(),
  }
));
