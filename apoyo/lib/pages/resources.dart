import 'package:flutter/material.dart';
import 'package:apoyo/services/apoyoBottomNavBar.dart';
import 'package:apoyo/services/apoyoDrawer.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Resources',
          style: TextStyle(
          color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[800],
      ),
      drawer: ApoyoDrawer(),
      bottomNavigationBar: ApoyoBottomNavBar(),
    );
  }
}
