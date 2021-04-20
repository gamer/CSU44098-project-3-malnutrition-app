import 'package:flutter/material.dart';
import 'package:website/location.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {

  List<charts.Series<PieData, String>> _pieData;
  @override void initState(){
    super.initState();
    _pieData = List<charts.Series<PieData, String>>();
  }

  generateData(int dIndex, int mIndex) {
    _pieData.add(
      charts.Series(
        domainFn: (PieData data, _) => data.activity,
        measureFn: (PieData data, _) => data.time,
        id: 'Time spent',
        data: locations.getDepartments()[dIndex].piedata,
        labelAccessorFn: (PieData row, _) => '${row.activity}: ${row.time}',
        colorFn: (PieData data, __) => data.color,
      ),
    );
    return _pieData;
  }

  int mIndex = 0;
  int dIndex = 0;

  @override
  Widget build(BuildContext context) {
  return Expanded(
    child:  charts.PieChart(
      generateData(dIndex, mIndex),
      animate: false,
      animationDuration: Duration(seconds: 5),
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 100,
        arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.outside)
          ],
        ),
      ),
    );
  }
}
