import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokevet_flutter/screens/welcome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            FirebaseAuth.instance.authStateChanges().listen((User user) {
              if (user == null) {
                print('User is currently signed out!');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Welcome()));
              } else {
                print('User is signed in!');
              }
            });
          },
        ),
      ),
    );
  }
}
