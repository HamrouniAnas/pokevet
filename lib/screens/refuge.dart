import 'package:flutter/material.dart';

class Refuge extends StatefulWidget {
  const Refuge({Key key}) : super(key: key);

  @override
  _RefugeState createState() => _RefugeState();
}

class _RefugeState extends State<Refuge> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("$_count")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box_outlined),
        onPressed: () => setState(() {
          _count++;
        }),
      ),
    );
  }
}
