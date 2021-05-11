import 'package:flutter/material.dart';
import 'package:pokevet_flutter/screens/boutique.dart';
import 'package:pokevet_flutter/screens/g%C3%A9olocalisation.dart';
import 'package:pokevet_flutter/screens/refuge.dart';
import 'package:pokevet_flutter/services/custom_icons_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Refuge(),
    Boutique(),
    Geolocalisation(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () => Future.value(false),
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
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.refuge),
              label: 'Refuge',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.shop),
              label: 'Boutique',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.geolocalisation),
              label: 'Géolocalisation',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
