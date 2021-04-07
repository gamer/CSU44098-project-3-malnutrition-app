import 'package:flutter/material.dart';

class ApoyoBottomNavBar extends StatelessWidget {
  const ApoyoBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      onTap: (index) {
        Navigator.pushReplacementNamed(context, index == 2 ? '/offlinePatients' : index == 3 ? '/addPatient' : '/home');
      },
      backgroundColor: Colors.blue[800],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.blue[800],
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blue[800],
          icon: Icon(Icons.info_outline),
          label: 'info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services_outlined),
          label: 'patients',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outlined,),
          label: 'add',
        ),
      ],
    );
  }
}
