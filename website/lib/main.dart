import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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
            new PieData('Severe', 35.8),
            new PieData('Moderate', 8.3),
            new PieData('Minor', 10.8),
            new PieData('Healthy', 15.6),
        ];
    _pieData.add(
        charts.Series(
            domainFn: (PieData data, _) => data.activity,
            measureFn: (PieData data, _) => data.time,
            id: 'Time spent',
            data: piedata,
            labelAccessorFn: (PieData row, _) => '${row.activity}',
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
            body: Center(
            child: charts.PieChart(
                generateData(),
                animate: true,
                animationDuration: Duration(seconds: 5),
                defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 100,
                    arcRendererDecorators: [
                        new charts.ArcLabelDecorator(
                   labelPosition: charts.ArcLabelPosition.inside)
                     ],
                 ),
              ),
          ),
      )
  );
 }
}
class PieData {
    String activity;
    double time;
    PieData(this.activity, this.time);
}
