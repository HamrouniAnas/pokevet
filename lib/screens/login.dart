import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text("No user found for that email."),
                ),
                barrierDismissible: true,
              );
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text("Wrong password provided for that user."),
                ),
                barrierDismissible: true,
              );
              print('Wrong password provided for that user.');
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
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final fbLoginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      // ignore: deprecated_member_use
      child: SignInButton(
        Buttons.Facebook,
        text: "Log In with Facebook",
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        //todo : fb login function
        onPressed: () {
          Future<UserCredential> signInWithFacebook() async {
            // Trigger the sign-in flow
            final AccessToken result =
                (await FacebookAuth.instance.login()) as AccessToken;

            // Create a credential from the access token
            final facebookAuthCredential =
                FacebookAuthProvider.credential(result.token);

            // Once signed in, return the UserCredential
            return await FirebaseAuth.instance
                .signInWithCredential(facebookAuthCredential);
          }
        },
        padding: EdgeInsets.all(12),
      ),
    );

    // ignore: deprecated_member_use
    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () async {
        var navRes = await Navigator.pushNamed(context, '/reset');
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text(navRes),
          ),
          barrierDismissible: true,
        );
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
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            fbLoginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
