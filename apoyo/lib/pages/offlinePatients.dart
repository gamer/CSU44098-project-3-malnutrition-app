import 'package:apoyo/services/apoyoBottomNavBar.dart';
import 'package:apoyo/services/apoyoDrawer.dart';
import 'package:flutter/material.dart';

class OfflinePatients extends StatefulWidget {
  @override
  _OfflinePatientsState createState() => _OfflinePatientsState();
}

class _OfflinePatientsState extends State<OfflinePatients> {

  List<String> patients = [
    "John Smith",
    "Jane Doe",
    "Conor Ryan",
    "Hugh Warren",
    "Sean Roche",
    'Stephen King',
    'Michael Mann',
    'John Le Carré',
    'Pedro Almodovar',
    'Oliviam Manning',
    'John Irving',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[800],
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
        itemCount: patients.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.account_circle_outlined),
              title: Text(patients[index]),
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
