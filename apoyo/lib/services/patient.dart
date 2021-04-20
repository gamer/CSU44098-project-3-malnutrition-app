import 'package:flutter/material.dart';

class Patient {
  String firstName;
  String surname;
  DateTime birthday;
  double weight;
  double height;
  String department;
  String municipality;

  Patient({this.firstName,this.surname,this.birthday,this.weight,this.height,this.department,this.municipality});

  String getFirstName(){
    if(firstName != null)
      return firstName;
    else return '';
  }

  String getSurname(){
    return surname;
  }

  DateTime getBirthday(){
    return birthday;
  }

  double getWeight(){
    return weight;
  }

  double getHeight(){
    return height;
  }

  String getDepartment(){
    return department;
  }

  String getMunicipality(){
    return municipality;
  }

  String toString(){
    String string = (
      'Name: ${getFirstName()} ${getSurname()}\n '
          'Height: ${getHeight()}\n '
          'Weight: ${getWeight()}\n '
          'Dep: ${getDepartment()}\n'
          'Mun: ${getMunicipality()}\n'
          'age: ${getBirthday().toString()}\n'
    );
    return string;
  }

  bool isEmpty(){
    if (firstName.isEmpty){
      return true;
    }
    if (surname.isEmpty){
      return true;
    }if (weight == null){
      return true;
    }if (height == null){
      return true;
    }if (department.isEmpty){
      return true;
    }if (municipality.isEmpty){
      return true;
    }
    if(birthday == null)
      return true;
    return false;
  }
}

class Patients{
  List<Patient> patients;

  Patients({this.patients});

  Patient getPatient(int index){
    return patients[index];
  }

  int getSize(){
    return patients.length;
  }

  void add(Patient patient){
    patients.add(patient);
  }
}