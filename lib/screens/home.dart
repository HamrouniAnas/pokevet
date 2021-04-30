import 'package:flutter/material.dart';
import 'package:pokevet_flutter/services/custom_icons_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          title: SizedBox(
            child: Image.asset('lib/assets/images/logo.png'),
            width: 120,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(CustomIcons.profile, size: 60),
                color: Colors.blueAccent,
                iconSize: 60,
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                })
          ],
          backgroundColor: Color.fromRGBO(55, 63, 81, 0.2),
          elevation: 0,
        ),
      ),
    );
  }
}
