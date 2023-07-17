import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //to store location name
  late String time; //to store time of that location
  late String flag; //to store asset flag icon
  late String url; //location url for api endpoint
  late bool isMorningTime; //true or false if daytime or not
  late bool isLunchTime; //true or false if daytime or not
  late bool isEveningTime; //true or false if daytime or not
  late bool isNightTime; //true or false if daytime or not
  late bool isMidnightTime; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    //make the request
    Uri okk = Uri.parse('http://worldtimeapi.org/api/timezone/${url}');
    Response response = await get(okk);
    Map data = jsonDecode(response.body);

    // //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // create Datetime oject
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
    isMorningTime = now.hour > 1 && now.hour < 8 ? true : false;
    isLunchTime = now.hour > 8 && now.hour < 14 ? true : false;
    isEveningTime = now.hour > 14 && now.hour < 18 ? true : false;
    isNightTime = now.hour > 18 && now.hour < 21 ? true : false;
    isMidnightTime = now.hour > 21 && now.hour < 24 ? true : false;

    DateTime parsedTime = DateTime.parse(now.toString());
    time = DateFormat('hh:mm a').format(parsedTime);
  }
}
