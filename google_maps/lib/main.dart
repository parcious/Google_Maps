import 'package:flutter/material.dart';
import 'package:google_maps/flutters_maps/quake_map_apps/quakes_map_app.dart';

import 'flutters_maps/simple_google_maps/show_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GMaps',
      //home: ShowSimpleMapState(),
      home: QuakesApp(),
    );
  }
}
