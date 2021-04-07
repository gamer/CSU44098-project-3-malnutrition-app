import 'package:apoyo/services/apoyoBottomNavBar.dart';
import 'package:apoyo/services/apoyoDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[800],
        title: Text(
          'Add Patient',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: ApoyoDrawer(),
      body: PatientInputForm(),
      bottomNavigationBar: ApoyoBottomNavBar(),
    );
  }
}

class PatientInputForm extends StatefulWidget {
  @override
  _PatientInputFormState createState() => _PatientInputFormState();
}

class _PatientInputFormState extends State<PatientInputForm> {
  


  @override
  Widget build(BuildContext context) {

    print('hello ${locations.getDepartments()[0].getMunicipalities()}');
    return DefaultTabController(

      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(

          title: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Location',
              ),
              Tab(
                text: 'Name/Age',
              ),
              Tab(
                text: 'Height/Weight',
              ),
            ],
          ),
        ),
        body: TabBarView( //Location
          children: <Widget>[
            Column(
              children: <Widget> [
                SizedBox(height: 100),
                Text('Department'),
                SizedBox(height: 20),
                CupertinoPicker(
                  onSelectedItemChanged: (val) {
                    setState(() {
                      dIndex = val;
                      mIndex = 0;
                    });
                  },
                  backgroundColor: Colors.grey[100],
                  itemExtent: 40,
                  children: locations.getDepartmentsName(),
                ),
                SizedBox(height: 100),
                Text('Municipality'),
                SizedBox(height: 20),
                CupertinoPicker(
                  onSelectedItemChanged: (val){
                    setState(() {
                      mIndex = val;
                    });
                  },
                  backgroundColor: Colors.grey[100],
                  itemExtent: 40,
                  children: locations.getDepartments()[dIndex].getMunicipalitiesNames(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(250, 50, 0, 0),
                  child: FlatButton(
                    color: Colors.blue[800],
                    onPressed: () {},
                    child: Text(
                     'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center( //Age/Name
              child: Column(
                children: <Widget>[
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your first name',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your surname',
                          ),
                        ),
                        MyCupertinoDate(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 190, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                onPressed: () {},
                                color: Colors.blue[800],
                                textColor: Colors.white,
                                icon: Icon(Icons.arrow_back),
                                label: Text('Back'),
                              ),
                              SizedBox(width: 100),
                              FlatButton(
                                onPressed: () {},
                                color: Colors.blue[800],
                                textColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Next'),

                                    SizedBox(width:4.0),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget> [
                SizedBox(height: 100),
                Text('Height'),
                SizedBox(height: 20),
                CupertinoPicker(
                  onSelectedItemChanged: (val){

                  },
                  looping: true,
                  backgroundColor: Colors.grey[100],
                  itemExtent: 50,
                  children: heights,
                ),
                SizedBox(height: 100),
                Text('Weight'),
                SizedBox(height: 20),
                CupertinoPicker(
                  onSelectedItemChanged: (val){

                  },
                  looping: true,
                  backgroundColor: Colors.grey[100],
                  itemExtent: 50,
                  children: weights,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(

                        ),
                        icon: Icon(Icons.arrow_back),
                        label: Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 100),
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Confirm'),
                            SizedBox(width:4.0),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  List<Widget> heights = List<Widget>.generate(300,
          (index) => Text('${index}cm'));

  List<Widget> weights = List<Widget>.generate(
      1000,
          (index) => Text('${(index)/10}kg')
  );

  List<Location> locates = [
    Location(department: 'Atlántida',municipalities: null),
    Location(department: 'Choluteca',municipalities: null),
    Location(department: 'Colón',municipalities: null),
    Location(department: 'Comayagua',municipalities: null),
    Location(department: 'Copán',municipalities: null),
    Location(department: 'Cortés',municipalities: null),
    Location(department: 'El Paraíso',municipalities: null),
    Location(department: 'Francisco Morazán',municipalities: null),
    Location(department: 'Gracias a Dios',municipalities: null),
    Location(department: 'Intibucá',municipalities: null),
    Location(department: 'Islas de la Bahía',municipalities: null),
    Location(department: 'La Paz',municipalities: null),
    Location(department: 'Lempira',municipalities: null),
    Location(department: 'Ocotepeque',municipalities: null),
    Location(department: 'Olancho',municipalities: null),
    Location(department: 'Santa Bárbara',municipalities: null),
    Location(department: 'Valle',municipalities: null),
    Location(department: 'Yoro',municipalities: null),

  ];

  int dIndex = 0;
  int mIndex = 0;

  Locations locations = Locations(
      departments: [
        Location(department: 'Atlántida',
            municipalities: [
              'Arizona',
              'El Porvenir',
              'Esparta',
              'Jutiapa',
              'La Ceiba',
              'La Masisca',
              'San Francisco',
              'Tela',
            ]),
        Location(department: 'Choluteca',
            municipalities: [
              'Apacilagya',
              'Choluteca',
              'Concepoción de María',
              'Duyure',
              'El Corpus',
              'El Triunfo',
              'Marcovia',
              'Morolica',
              'Namasigue',
              'Orocuina',
              'Pespire',
              'San Antonio de Flores',
              'San Isidro',
              'San José',
              'San Marcos de Colón',
              'Santa Ana de Yusguare',
            ]),
        Location(department: 'Colón',
            municipalities: [
              'Balfate',
              'Bonito Oriental',
              'Iriona',
              'Limón',
              'Sabá',
              'Santa Fé',
              'Santa Rosa de Aguán',
              'Sonaguera',
              'Tocoa',
              'Trujillo',
            ]),
        Location(department: 'Comayagua',
            municipalities: [
              'Ajuterique',
              'Comayagua',
              'El Rosario',
              'Esquías',
              'Humuya',
              'La Libertad',
              'Lamaní',
              'Las Lajas',
              'La Trinidad',
              'Lejamaní',
              'Meámbar',
              'Minas de Oro',
              'Ojos de Agua',
              'San Jerónimo',
              'San José de Comayagua',
              'San José del Potrero',
              'San Luis',
              'San Sebastián',
              'Siguatepeque',
              'Taulabe',
              'Villa de San Antonio',
            ]),
        Location(department: 'Copán',
            municipalities: [
              'Cabañas',
              'Concepción',
              'Copán Ruinas',
              'Corquín',
              'Cucuyagua',
              'Dolores',
              'Dulce Nombre',
              'El Paraíso',
              'Florida',
              'La Jiqua',
              'La Unión',
              'Nueva Arcadia',
              'San Agustín',
              'San Antonio',
              'San Jerónimo',
              'San José',
              'San Juan de Opoa',
              'San Nicolás',
              'San Pedro de Copán',
              'Santa Rita',
              'Santa Rosa de Copán',
              'Trinidad de Copán',
              'Veracruz',
            ]),
        Location(department: 'Cortés',
            municipalities: [
              'Choloma',
              'La Lima',
              'Omoa',
              'Pimienta',
              'Potrerillos',
              'Puerto Cortés',
              'San Antonio de Cortés',
              'San Francisco de Yojoa',
              'San Manuel',
              'San Pedro Sula',
              'Santa Cruz de Yojoa',
              'Villanueva',
            ]),
        Location(department: 'El Paraíso',
            municipalities: [
              'Alauca',
              'Danlí',
              'El Paraíso',
              'Guinope',
              'Jacaleapa  ',
              'Liure',
              'Morocelí',
              'Oropolí',
              'Potrerillos',
              'San Antonio de Flores',
              'San Lucas',
              'San Matías',
              'Soledad',
              'Teupasenti',
              'Texiguat',
              'Trojes',
              'Vado Ancho',
              'Yauyupe',
              'Yuscarán',
            ]),
        Location(department: 'Francisco Morazán',
            municipalities: [
              'Alubarén',
              'Cedros',
              'Curarén',
              'Distrito Central',
              'El Porvenir',
              'Guaimaca',
              'La Libertad',
              'La Venta',
              'Lepaterique',
              'Maraita',
              'Marale',
              'Nueva Armenia',
              'Ojojona',
              'Orica',
              'Reitoca',
              'Sabanagrande',
              'San Antonio de Oriente',
              'San Buenaventura',
              'San Ignacio',
              'San Juan de Flores',
              'San Miguelito',
              'Santa Ana',
              'Santa Lucía',
              'Talanga',
              'Tatumbla',
              'Valle de Ángeles',
              'Vallecillo',
              'Villa de San Francisco',
            ]),
        Location(department: 'Gracias a Dios',
            municipalities: [
              'Ahuas',
              'Brus Laguna',
              'Juan Francisco Bulnes',
              'Puerto Lempira',
              'Ramón Villeda Morales',
              'Wampusirpi',
            ]),
        Location(department: 'Intibucá',
            municipalities: [
              'Camasca',
              'Colomoncagua',
              'Concepción',
              'Dolores',
              'Intibucá',
              'Jesús de Otoro',
              'La Esperanza',
              'Magdalena',
              'Masaguara',
              'San Antonio',
              'San Francisco de Opalaca',
              'San Isidro',
              'San Juan',
              'San Marco de Sierra',
              'San Miguelito',
              'Santa Lucía',
              'Yamaranguila',
            ]),
        Location(department: 'Islas de la Bahía',
            municipalities: [
              'Guanaja',
              'José Santos Guardiola',
              'Roatán',
              'Útila',
            ]),
        Location(department: 'La Paz',
            municipalities: [
              'Aguaqueterique',
              'Cabañas',
              'Cane',
              'Chinacla',
              'Guajiquiro',
              'La Paz',
              'Lauterique',
              'Marcala',
              'Mercedes de Oriente',
              'Opatoro',
              'San Antonio del Norte',
              'San José',
              'San Juan',
              'San Pedro de Tutule',
              'Santa Ana',
              'Santa Elena',
              'Santa María',
              'Santiago de Puringla',
            ]),
        Location(department: 'Lempira',
            municipalities: [
              'Yarula',
              'Belén',
              'Candelaria',
              'Cololaca',
              'Erandique',
              'Gracias',
              'Gualcince',
              'Guarita',
              'La Campa',
              'La Iguala',
              'Las Flores',
              'La Unión',
              'La Virtud',
              'Lepaera',
              'Mapulaca',
              'Piraera',
              'San Andrés',
              'San Francisco',
              'San Juan Guarita',
              'San Manuel Colohete',
              'San Marcos de Caiquín',
              'San Rafael',
              'San Sebastian',
              'Santa Cruz',
              'Talgua',
              'Tambla',
              'Tomalá',
              'Valladolid',
              'Virginia',
            ]),
        Location(department: 'Ocotepeque',
            municipalities: [
              'Belén Gualcho',
              'Concepción',
              'Dolores Merendon',
              'Fraternidad',
              'La Encarnación',
              'La Labor',
              'Lucerna',
              'Mercedes',
              'Ocotepeque',
              'San Fernando',
              'San Francisco del Valle',
              'San Jorge',
              'San Marcos',
              'Santa Fé',
              'Sensenti',
              'Sinuapa',
            ]),
        Location(department: 'Olancho',
            municipalities: [
              'Campamento',
              'Catacamas',
              'Concordia',
              'Dulce Nombre de Culmí',
              'El Rosario',
              'Esquipulas del Norte',
              'Gualaco',
              'Guarizama',
              'Guata',
              'Guayape',
              'Jano',
              'Juticalpa',
              'La Unión',
              'Mangulile',
              'Manto',
              'Patuca',
              'Salamá',
              'San Esteban',
              'San Francisco de Becerra',
              'San Francisco de la Paz',
              'Santa Maria del Real',
              'Silca',
              'Yocón',
            ]),
        Location(department: 'Santa Bárbara',
            municipalities: [
              'Arada',
              'Atima',
              'Azacualpa',
              'Ceguaca',
              'Chinda',
              'Concepción del Norte',
              'Concepción del Sur',
              'El Nispero',
              'Gualala',
              'Ilama',
              'Las Vegas',
              'Macuelizo',
              'Naranjito',
              'Nueva Frontera',
              'Nuevo Celilac',
              'Petoa',
              'Protección',
              'Quimistán',
              'San Francisco de Ojuera',
              'San José de Colinas',
              'San Luis',
              'San Marcos',
              'San Nicolás',
              'San Pedro Zacapa',
              'Santa Bárbara',
              'Santa Rita',
              'San Vicente Centenario',
              'Trinidad',
            ]),
        Location(department: 'Valle',
            municipalities: [
              'Alianza',
              'Amapala',
              'Aramecina',
              'Caridad',
              'Goascorán',
              'Langue',
              'Nacaome',
              'San Francisco de Coray',
              'San Lorenzo',
            ]),
        Location(department: 'Yoro',
            municipalities: [
              'Arenal',
              'El Negrito',
              'El Progreso',
              'Jocón',
              'Morazán',
              'Olanchito',
              'Santa Rita',
              'Sulaco',
              'Victoria',
              'Yorito',
              'Yoro',
              'Honduras',
            ]),
      ]
  );

}

class MyCupertinoDate extends StatefulWidget {
  @override
  _MyCupertinoDateState createState() => _MyCupertinoDateState();
}

class _MyCupertinoDateState extends State<MyCupertinoDate> {
  DateTime _chosenDateTime = DateTime.now();

  void _showDatePicker(ctx){
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 500,
        color: Color.fromARGB(255,255, 255, 255),
        child: Column(
          children: [
            Container(
              height: 400,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  maximumYear: DateTime.now().year,
                  initialDateTime: _chosenDateTime,
                  onDateTimeChanged: (datetime) {
                    setState(() {
                      _chosenDateTime = datetime;
                    });
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Center(
              child: FlatButton(
                color: Colors.blue[700],
                textColor: Colors.white,
                child:Text('Add Birthday'),
                onPressed: () => _showDatePicker(context),
              ),
            ),
          ],
        ),
      );
  }
}

class Location{

  String department;
  List<String> municipalities;

  Location({this.department,this.municipalities});

  String getDepartmentName(){
    return department;
  }

  List<String> getMunicipalities(){
    return municipalities;
  }

  List<Widget> getMunicipalitiesNames(){
    List<Widget> mNames = List<Widget>.generate(municipalities.length,
            (index) => Text(municipalities[index].toString()));
    return mNames;
  }
}

class Locations {

  List<Location> departments;

  Locations({this.departments});

  List<Location> getDepartments(){
    return departments;
  }

  List<Widget> getDepartmentsName(){
    List<Widget> dNames = List<Widget>.generate(departments.length,
            (index) => Text(departments[index].getDepartmentName()));
    return dNames;
  }

}
