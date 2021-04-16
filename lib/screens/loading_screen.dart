import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('lib/assets/lottie/LoadingScreen.json'),
      ),
    );
  }
}
