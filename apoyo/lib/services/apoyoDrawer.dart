import 'package:flutter/material.dart';

class ApoyoDrawer extends StatelessWidget {
  const ApoyoDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 63,
            child: DrawerHeader(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.menu),
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(225, 0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.blueAccent[400],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt),
            title: Text('Add Patient'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/addPatient');
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services_outlined),
            title: Text('Offline Patients'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/offlinePatients');
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Resources'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(height: 30.0, color: Colors.grey[500]),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.tag_faces_rounded),
            title: Text('Account'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}