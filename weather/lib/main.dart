import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/loading.dart';
import 'package:weather/pages/choose_location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': ((context) => Loading()),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ));
