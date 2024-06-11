import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _currentUrlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  void _handleMarkerTap() {
    print("Le marqueur a été tapé !");
  }

  final List<Marker> _markers = [
    Marker(
      point: const LatLng(50.8503, 4.3517),
      child: GestureDetector(
        onTap: () {
          print("L'icône a été cliquée !");
        },
        child: const Icon(
          Icons.place,
          color: Colors.red,
          size: 30,
        ),
      ),
    ),
  ];

  void _changeUrlTemplate() {
    setState(() {
      _currentUrlTemplate =
      'https://i0.wp.com/www.bragitoff.com/wp-content/uploads/2015/11/GTAV_SATELLITE_2048x2048.png';

      _markers.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          center: LatLng(51.509364, -0.128928),
          zoom: 0,
          maxZoom: 4,
        ),
        children: [
          TileLayer(
            urlTemplate: _currentUrlTemplate,
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeUrlTemplate,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}