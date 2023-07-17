import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'america.png', url: 'America/Chicago'),
    WorldTime(
        location: 'New York', flag: 'america.png', url: 'America/New_York'),
    WorldTime(location: 'South Korea', flag: 'korea.png', url: 'Asia/Seoul'),
    WorldTime(
        location: 'Indonesia', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Delhi', flag: 'india.png', url: 'Asia/Dili'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: Container(
                    width: 60, // Adjust the size to your desired avatar size
                    height: 60, // Adjust the size to your desired avatar size
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/${locations[index].flag}'), // Replace with AssetImage if using local assets
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
