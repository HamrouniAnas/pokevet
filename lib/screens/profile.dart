import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokevet_flutter/screens/welcome.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("Logout"),
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
    );
  }
}
