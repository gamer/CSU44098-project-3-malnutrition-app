import 'package:flutter/material.dart';
import 'package:apoyo/services/apoyoBottomNavBar.dart';
import 'package:apoyo/services/apoyoDrawer.dart';
import 'package:apoyo/services/patient.dart';

class LocalPatient extends StatelessWidget {
  final Patients patients;
  final int index;

  const LocalPatient({
    Key key,
    this.patients,
    this.index,
  }) : super(key: key);

  double calculateBMI(Patient patient){
    double height = patient.getHeight();
    double weight = patient.getWeight();
    return weight / ((height / 100) * (height / 100));
  }

  String severity(Patient patient){
    double bMI = calculateBMI(patient);
    String sev = 'severe';
    String mod = 'moderate';
    String min = 'minor';
    String nor = 'normal';

    if(bMI < 18.5)
      return sev;
    else if(bMI < 20)
      return mod;
    else if(bMI < 22.5)
      return min;
    else
      return nor;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                Icons.account_circle_outlined,
              size: 300
            ),
            Text(
                '${patients.getPatient(index).getFirstName()} ${patients.getPatient(index).getSurname()}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Text(
                'height: ${patients.getPatient(index).getHeight().toInt()}cm ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
                'weight: ${patients.getPatient(index).getWeight()}kg ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
                'department: ${patients.getPatient(index).getDepartment()} ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
                'municipality: ${patients.getPatient(index).getMunicipality()}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
                'age: ${(new DateTime.now().year - patients.getPatient(index).getBirthday().year ).toString()}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
                'BMI: ${calculateBMI(patients.getPatient(index)).toStringAsFixed(3)}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
                'Severity: ${severity(patients.getPatient(index))}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

          ],
        ),
      ),
      drawer: ApoyoDrawer(),
      bottomNavigationBar: ApoyoBottomNavBar(),
    );
  }
}


