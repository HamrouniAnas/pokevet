import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    //const primary=const Color.fromRGBO(1, 146, 251, 0.4);
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

    final resetButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          try {
            await FirebaseAuth.instance
                .sendPasswordResetEmail(email: emailController.text);

            Navigator.pop(context, 'Reset mail sent');
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text('There is no user with this mail address'),
                ),
                barrierDismissible: true,
              );
              print('user not found');
            }
          } catch (e) {
            print(e);
          }
        },
        padding: EdgeInsets.all(12),
        color: primary,
        child: Text('Reset Password', style: TextStyle(color: Colors.white)),
      ),
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
            SizedBox(height: 24.0),
            resetButton,
          ],
        ),
      ),
    );
  }
}
