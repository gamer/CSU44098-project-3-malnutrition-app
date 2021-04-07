import 'package:apoyo/pages/chooseLocation.dart';
import 'package:apoyo/pages/offlinePatients.dart';
import 'package:flutter/material.dart';
import 'package:apoyo/pages/home.dart';
import 'package:apoyo/pages/loading.dart';
import 'package:apoyo/pages/chooseLocation.dart';
import 'package:apoyo/pages/offlinePatients.dart';
import 'package:apoyo/pages/addPatient.dart';

void main () => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/offlinePatients': (context) => OfflinePatients(),
    '/addPatient': (context) => AddPatient(),
  },
));

