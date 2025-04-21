import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class GoogleMap extends StatefulWidget {
  const GoogleMap({super.key});

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  late gmaps.GoogleMapController _mapController;
  static const gmaps.CameraPosition _initialPosition = gmaps.CameraPosition(
    target: gmaps.LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return gmaps.GoogleMap(
      initialCameraPosition: _initialPosition,
      onMapCreated: (gmaps.GoogleMapController controller) {
        _mapController = controller;
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
