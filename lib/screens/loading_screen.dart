import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokevet_flutter/screens/home.dart';
import 'package:pokevet_flutter/screens/welcome.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: Center(
        child: Lottie.asset('lib/assets/lottie/LoadingScreen.json'),
      ),
    );*/
    if (_error) {
      print('Error');
    }
    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: Lottie.asset('lib/assets/lottie/LoadingScreen.json'),
        ),
      );
    }
    print('loading');
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      print('user signed in');
      return Home();
    }
    print('user not signed in');
    return Welcome();
  }
}
