import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    final logo = Hero(
      tag: 'hero',
      child: Image.asset('lib/assets/images/logo1.png'),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: usernameController,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          try {
            UserCredential userCredential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text('The password provided is too weak.'),
                ),
                barrierDismissible: true,
              );
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text('The account already exists for that email.'),
                ),
                barrierDismissible: true,
              );
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }
          FirebaseAuth.instance.authStateChanges().listen((User user) {
            if (user == null) {
              print('User is currently signed out!');
            } else {
              print('User is signed in!');
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => Home()));
            }
          });
        },
        padding: EdgeInsets.all(12),
        color: primary,
        child: Text('Sign-up', style: TextStyle(color: Colors.white)),
      ),
    );

    // ignore: deprecated_member_use
    final forgotLabel = FlatButton(
      child: Text(
        'Have an account?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Login()));
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            signupButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
