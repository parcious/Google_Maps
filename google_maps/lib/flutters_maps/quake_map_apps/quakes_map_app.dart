import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps/flutters_maps/quake_map_apps/model/quake_model.dart';
import 'package:google_maps/flutters_maps/quake_map_apps/network/network.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class QuakesApp extends StatefulWidget {
  const QuakesApp({super.key});

  @override
  State<QuakesApp> createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  late Future<QuakeModel> _quakesData;
  Completer<GoogleMapController> _controller = Completer();
List<Marker> _markerList=<Marker>[];

  @override
  void initState() {
    super.initState();
    _quakesData = Network().getAllQuakes();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _buildGoogleMap(context),
      ],

    ),
    floatingActionButton: FloatingActionButton.extended(onPressed: (){
      FindQuakes();
    },label: Text("Find Quakes"),),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(36.1083333, -117.8608333), zoom: 3),
      ),
    );
  }
  void FindQuakes(){
    setState(() {
      _markerList.clear();
      _handleResponse();
    });
  }
  void _handleResponse(){
    setState(() {
      _quakesData.then((quakes)=>{
      
      });
    });
  }
}
