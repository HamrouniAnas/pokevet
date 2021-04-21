import 'package:flutter/material.dart';
import 'package:pokevet_flutter/screens/home.dart';
import 'package:pokevet_flutter/screens/welcome.dart';
import 'package:pokevet_flutter/screens/loading_screen.dart';
import 'package:pokevet_flutter/screens/login.dart';
import 'package:pokevet_flutter/screens/signup.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/welcome': (context) => Welcome(),
      '/login': (context) => Login(),
      '/signup': (context) => Signup(),
      '/home': (context) => Home(),
    }));
