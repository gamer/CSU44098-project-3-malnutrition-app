import 'package:apoyo/pages/chooseLocation.dart';
import 'package:apoyo/pages/offlinePatients.dart';
import 'package:flutter/material.dart';
import 'package:apoyo/pages/home.dart';
import 'package:apoyo/pages/loading.dart';
import 'package:apoyo/pages/chooseLocation.dart';
import 'package:apoyo/pages/offlinePatients.dart';
import 'package:apoyo/pages/addPatient.dart';
import 'package:apoyo/pages/resources.dart';
import 'package:apoyo/pages/localPatient.dart';
import 'package:apoyo/services/patient.dart';

void main () => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/offlinePatients': (context) => OfflinePatients(),
    '/addPatient': (context) => AddPatient(),
    '/resources': (context) => Resources(),
  },
  onGenerateRoute: (settings){
    if (settings.name == '/localPatient'){
      final ScreenArguments args = settings.arguments as ScreenArguments;
      return MaterialPageRoute(
        builder: (context){
          return LocalPatient(
            patients: args.patients,
            index: args.index,
          );
        }
      );
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  },
));

class ScreenArguments {
  final Patients patients;
  final int index;

  ScreenArguments({this.patients, this.index});
}

class ScreenArguments2 {
  Patient patient;

  ScreenArguments2({this.patient});
}