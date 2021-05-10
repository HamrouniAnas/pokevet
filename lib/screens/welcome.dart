import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    void initState() {
      super.initState();
    }

    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 48.0),
              Image.asset(
                'lib/assets/images/logo3.png',
                width: 55,
                height: 55,
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  'we gotta shelter them all!',
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 24.0),
              SizedBox(
                  height: 50,
                  width: 300,
                  child: _button(
                      "SIGN IN", Colors.white, primary, primary, Colors.white)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "or ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: "create an account",
                      style: TextStyle(color: primary),
                    )
                  ]),
                ),
              ),
              // loginButton,
              //fbLoginButton,
              // forgotLabel
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
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
