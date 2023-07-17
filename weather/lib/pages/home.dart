import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print('okk');
    print(data);

    //set background
    late String bgimge;
    late Color bgcolor;

    if (data['isMorningTime']) {
      bgimge = 'istockphoto-479184640-612x612.jpg';
      bgcolor = Colors.white;
    } else if (data['isLunchTime']) {
      bgimge = 'istockphoto-476958471-612x612.jpg';
      bgcolor = Colors.green;
    } else if (data['isEveningTime']) {
      bgimge = 'istockphoto-1455302746-170667a.jpg';
      bgcolor = Colors.orange;
    } else if (data['isNightTime']) {
      bgimge = 'istockphoto-809971888-170667a.webp';
      bgcolor = Colors.black;
    } else {
      bgimge = 'istockphoto-1073040070-612x612.jpg';
      bgcolor = Colors.black;
    }

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimge'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isMorningTime': result['isMorningTime'],
                        'isLunchTime': result['isLunchTime'],
                        'isEveningTime': result['isEveningTime'],
                        'isNightTime': result['isNightTime'],
                        'isMidnightTime': result['isMidnightTime'],
                      };
                      print("row");
                      print(data);
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
