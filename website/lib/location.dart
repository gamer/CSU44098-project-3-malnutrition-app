import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';


class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}


class _DropDownState extends State<DropDown> {

  List<charts.Series<PieData, String>> _pieData;

  @override void initState() {
    _pieData = List<charts.Series<PieData, String>>();
  }

  var piedata = [
    new PieData('Severe', new Random().nextInt(300), charts.MaterialPalette.red.shadeDefault),
    new PieData('Moderate', new Random().nextInt(200), charts.MaterialPalette.yellow.shadeDefault),
    new PieData('Minor', new Random().nextInt(700), charts.MaterialPalette.green.shadeDefault),
    new PieData('Healthy', new Random().nextInt(2500), charts.MaterialPalette.blue.shadeDefault),
  ];
  

  int dIndex = 0;
  int mIndex = 0;



  @override
  Widget build(BuildContext context) {

    var series = [
      new charts.Series(id: 'Malnutrition',
          data: piedata,

          domainFn: (PieData piedata, _ ) => piedata.activity,
          measureFn: (PieData piedata, _ ) => piedata.time,
          colorFn: (PieData piedata, _ ) => piedata.color,
          labelAccessorFn: (PieData row, _) => '${row.activity}: ${row.time}',

    ),
    ];

    var chart = new charts.PieChart(
        series,
        animate: true,
        animationDuration: Duration(seconds: 2),
        defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 100,
          arcRendererDecorators: [
            new charts.ArcLabelDecorator(
                labelPosition: charts.ArcLabelPosition.outside)
          ],
        ),
      );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton<String>(
              value: locations.getDepartmentsStrings()[dIndex],
              onChanged: (value){
                setState(() {
                  dIndex = locations.getDepartmentsStrings().indexOf(value);
                  mIndex = 0;
                  piedata = [
                  new PieData('Severe', new Random().nextInt(300), charts.MaterialPalette.red.shadeDefault),
                  new PieData('Moderate', new Random().nextInt(200), charts.MaterialPalette.yellow.shadeDefault),
                  new PieData('Minor', new Random().nextInt(700), charts.MaterialPalette.green.shadeDefault),
                  new PieData('Healthy', new Random().nextInt(2500), charts.MaterialPalette.blue.shadeDefault),
                  ];
                });
              },
              items: locations.getDepartmentsStrings().map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem(
                  value: value,
                    child: Text(value)
                );
              }).toList(),

            ),
            DropdownButton(
              value: locations.getDepartments()[dIndex].getMunicipalities()[mIndex],
              onChanged: (value){
                setState(() {
                  mIndex = locations.getDepartments()[dIndex].getMunicipalities().indexOf(value);
                  piedata = [
                    new PieData('Severe', new Random().nextInt(300), charts.MaterialPalette.red.shadeDefault),
                    new PieData('Moderate', new Random().nextInt(200), charts.MaterialPalette.yellow.shadeDefault),
                    new PieData('Minor', new Random().nextInt(700), charts.MaterialPalette.green.shadeDefault),
                    new PieData('Healthy', new Random().nextInt(2500), charts.MaterialPalette.blue.shadeDefault),
                  ];
                });
              },
              items: locations.getDepartments()[dIndex].getMunicipalities().map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem(
                    value: value,
                    child: Text(value)
                );
              }).toList(),
            )
          ],
        ),
        buildExpanded(chart),
      ],
    );
  }

  Expanded buildExpanded(var chart) {
    return Expanded(
        child:  chart,
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

  List<String> getDepartmentsStrings(){
    List<String> dStrings = List<String>.generate(departments.length,
            (index) => departments[index].getDepartmentName());
        return dStrings;
  }

}

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
            ],
             ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
        Location(department: 'Gracias a Dios',
            municipalities: [
              'Ahuas',
              'Brus Laguna',
              'Juan Francisco Bulnes',
              'Puerto Lempira',
              'Ramón Villeda Morales',
              'Wampusirpi',
            ],
           ),
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
            ],
           ),
        Location(department: 'Islas de la Bahía',
            municipalities: [
              'Guanaja',
              'José Santos Guardiola',
              'Roatán',
              'Útila',
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
           ),
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
            ],
         ),
      ]
  );

class PieData {
  String activity;
  int time;
  charts.Color color;
  PieData(this.activity, this.time, this.color);
}
