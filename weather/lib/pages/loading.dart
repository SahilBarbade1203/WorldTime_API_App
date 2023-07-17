import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:weather/services/world_time.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isMorningTime': instance.isMorningTime,
      'isLunchTime': instance.isLunchTime,
      'isEveningTime': instance.isEveningTime,
      'isNightTime': instance.isNightTime,
      'isMidnightTime': instance.isMidnightTime,
    });
  }

  // void getTime() async {
  //   Uri okk = Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Berlin');
  //   Response response = await get(okk);
  //   Map data = jsonDecode(response.body);

  //   print(data['datetime']);
  // }

  @override
  void initState() {
    super.initState();
    // getTime();
    setupWorldTime();
    // print('Hey There!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
