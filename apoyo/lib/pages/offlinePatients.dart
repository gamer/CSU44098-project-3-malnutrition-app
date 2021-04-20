import 'package:apoyo/main.dart';
import 'package:apoyo/services/apoyoBottomNavBar.dart';
import 'package:apoyo/services/apoyoDrawer.dart';
import 'package:flutter/material.dart';
import 'package:apoyo/services/patient.dart';

class OfflinePatients extends StatefulWidget {
  final Patient patient;
  final String empty;

  OfflinePatients({Key key, this.patient, this.empty}): super(key: key);
  @override
  _OfflinePatientsState createState() => _OfflinePatientsState(patient: this.patient, empty: this.empty);
}

class _OfflinePatientsState extends State<OfflinePatients> {
  Patient patient;
  Patients patients;
  String empty;

  _OfflinePatientsState({this.patient,this.empty}){
    patients = new Patients(patients: [
      new Patient(firstName: "John", surname: "Smith", birthday: DateTime(2000), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Jane", surname: "Doe", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Conor", surname: "Ryan", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Hugh", surname: "Warren", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Sean", surname: "Roche", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Stephen", surname: "King", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Michael", surname: "Mann", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "John", surname: "Le Carré", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Pedro", surname: "Almodovar", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "Olivia", surname: "Manning", birthday: DateTime(2000, ), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
      new Patient(firstName: "John", surname: "Irving", birthday: DateTime(2000,), weight: 15.4, height: 150, department: 'Atlántida', municipality: 'Arizona'),
    ]);
    if(empty !=  null)
      patients.add(this.patient);
  }

  @override
  Widget build(BuildContext context) {
    print('yello');
    print(this.patient.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'OfflinePatients',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: ApoyoDrawer(),
      body: ListView.builder(
        itemCount: patients.getSize(),
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/localPatient',arguments: ScreenArguments(patients: patients, index: index));
              },
              leading: Icon(Icons.account_circle_outlined),
              title: Text(
                  "${patients.getPatient(index).getFirstName()} ${patients.getPatient(index).getSurname()}"
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: ApoyoBottomNavBar(),
      floatingActionButton: UploadButton(),
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: const Text('Patients uploaded'),
          ),
        );
      },
      backgroundColor: Colors.blue[800],
      child: Icon(
        Icons.upload_sharp,
        color: Colors.white,
      ),
    );
  }
}
