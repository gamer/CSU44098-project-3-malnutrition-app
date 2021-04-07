import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for UI
  String time; // the time in that location
  String flag; //url for image of flag
  String url; //location url for api endpoint
  bool isDayTime; //daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      //print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //set the time property
      isDayTime = 6 < now.hour && 20 > now.hour ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
      isDayTime = true;
    }
  }

}