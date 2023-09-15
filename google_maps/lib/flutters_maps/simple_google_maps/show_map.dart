import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMapState extends StatefulWidget {
  @override
  State<ShowSimpleMapState> createState() => _ShowSimpleMapStateState();
}

class _ShowSimpleMapStateState extends State<ShowSimpleMapState> {
  // const _ShowSimpleMapState({super.key});
  late GoogleMapController mapController;

  static LatLng _center = const LatLng(22.7196, 75.8577);
  static LatLng _zehntech = const LatLng(22.7354065, 75.8724529);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
          markers: {IndoreMarker, ZehnTechMarker},
          mapType: MapType.satellite,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToIntel,
        label: Text("Zehntech"),
        icon: Icon(Icons.business_center),
      ),
    );
  }

  static final CameraPosition intelPosition = CameraPosition(
      target: LatLng(22.753476251244816, 75.86508676564421),
      bearing: 160,
      tilt: 24,
      zoom: 18.70);

  Future<void> _goToIntel() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }

  Marker IndoreMarker = Marker(
    markerId: MarkerId("Indore(M.P)"),
    position: _center,
    infoWindow: InfoWindow(
        title: "Indore", snippet: "This is the Cleanest City of Bharat"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  );
  Marker ZehnTechMarker = Marker(
    markerId: MarkerId("Indore(M.P)"),
    position: _zehntech,
    infoWindow: InfoWindow(
        title: "ZehnTech", snippet: "This is the Company  in which i worked"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  );
}
