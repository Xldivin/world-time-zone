import 'package:different_time_zones/pages/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:different_time_zones/pages/home.dart';
import 'package:different_time_zones/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },

));

