import 'package:flutter/material.dart';
import 'package:pokevet_flutter/screens/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    void initState() {
      super.initState();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: _button(
                      "SIGN IN", Colors.white, primary, primary, Colors.white),
                ),
              ),
              Stack(children: <Widget>[
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 250, 80, 20),
                    child: Image.asset('lib/assets/images/logo.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(118, 310, 30, 20),
                  child: Text(
                    'we gotta shelter them all!',
                    style:
                        TextStyle(color: primary, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(137, 421, 30, 20),
                  child: Text(
                    'or',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(144, 405, 30, 20),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'create an account',
                      style: TextStyle(color: primary),
                    ),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor) {
    // ignore: deprecated_member_use
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      // shape: RoundedRectangleBorder(
      //     borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Login()));
      },
    );
  }
}
