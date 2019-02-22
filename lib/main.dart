import 'package:flutter/material.dart';
import './ui/collapsing_navigation_drawer.dart';
import './ui/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: drawerBackgroundColor,
            title: Text("Collapsin Navigation Drawer"),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                color: selectedColor,
              ),
              CollapsingNavigationDrawer(),
            ],
          )),
    );
  }
}
