import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _initialPosition = const LatLng(6.9271, 79.8612); // Colombo

  final List<Map<String, dynamic>> _locations = [
    {
      "name": "Peliyagoda Sri Dramaraja temple",
      "lat": 6.9683,
      "lng": 79.9043,
      "date": "20th Dec",
      "time": "8:00 AM - 4:00 PM"
    },
    {
      "name": "Kollupitiya Community Hall",
      "lat": 6.9206,
      "lng": 79.8499,
      "date": "12th Dec",
      "time": "8:30 AM - 4:00 PM"
    },
    {
      "name": "Dehiwala Public Hall",
      "lat": 6.8529,
      "lng": 79.8652,
      "date": "28th Nov",
      "time": "9:00 AM - 4:00 PM"
    },
  ];

  Set<Marker> _createMarkers() {
    return _locations.map((location) {
      return Marker(
        markerId: MarkerId(location['name']),
        position: LatLng(location['lat'], location['lng']),
        infoWindow: InfoWindow(
          title: location['name'],
          snippet: "${location['date']} | ${location['time']}",
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text("Blood Donation Locations",
            style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(color: const Color(0xFFD60033), width: 1.5),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search a location...",
                  hintStyle: TextStyle(color: Color(0xFFD60033), fontSize: 15),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  suffixIcon: Icon(Icons.search, color: Colors.black87),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialPosition, zoom: 12),
              markers: _createMarkers(),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              },
            ),
          ),
          Container(
            color: Colors.green,
            padding: const EdgeInsets.all(10),
            child: const Text("Upcoming Blood Donation Events",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                final location = _locations[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(location['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${location['date']} | ${location['time']}"),
                    leading: const Icon(Icons.location_on, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
