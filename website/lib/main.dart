import 'package:flutter/material.dart';
import 'package:website/location.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override _MyAppState createState() => _MyAppState();}
class _MyAppState extends State<MyApp> {
  List<charts.Series<PieData, String>> _pieData;
  @override void initState() {
    super.initState();
    _pieData = List<charts.Series<PieData, String>>();
  }
  generateData() {
    var piedata = [
      new PieData('Severe', new Random().nextInt(300), charts.MaterialPalette.red.shadeDefault),
      new PieData('Moderate', new Random().nextInt(200), charts.MaterialPalette.yellow.shadeDefault),
      new PieData('Minor', new Random().nextInt(700), charts.MaterialPalette.green.shadeDefault),
      new PieData('Healthy', new Random().nextInt(2500), charts.MaterialPalette.blue.shadeDefault),
    ];
    _pieData.add(
      charts.Series(
        domainFn: (PieData data, _) => data.activity,
        measureFn: (PieData data, _) => data.time,
        id: 'Time spent',
        data: piedata,
        labelAccessorFn: (PieData row, _) => '${row.activity}: ${row.time}',
        colorFn: (PieData data, __) => data.color,
      ),
    );
    return _pieData;
  }
  @override Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Apoyo'),
          ),
          body: DropDown(),
          ),
        );

  }
}
class PieData {
  String activity;
  int time;
  charts.Color color;
  PieData(this.activity, this.time, this.color);
}
