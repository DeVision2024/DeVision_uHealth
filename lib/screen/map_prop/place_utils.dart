import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Place({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'] ?? '',
      address: json['vicinity'] ?? '',
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
    );
  }
}

Future<List<Place>> getNearestHospitals(double latitude, double longitude) async {
  final String apiKey = 'AIzaSyCMB2mdjCtUjFu2EArEi1xLFbzSs_OUdJY';
  final String endpoint = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
  final String type = 'hospital';
  final String radius = '5000';

  final String url = '$endpoint?location=$latitude,$longitude&type=$type&radius=$radius&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == 'OK') {
      final List<dynamic> results = data['results'];
      List<Place> places = results.map((result) => Place.fromJson(result)).toList();
      return places;
    } else {
      throw Exception('Error: ${data['status']}');
    }
  } else {
    throw Exception('Failed to load data');
  }
}

void showRouteToHospital(BuildContext context, Place destination) {
  // Navigasi ke layar peta dengan menunjukkan rute ke tujuan (rumah sakit)
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MapWithRoute(destination),
    ),
  );
}

class MapWithRoute extends StatelessWidget {
  final Place destination;

  const MapWithRoute(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route to Destination'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(destination.latitude, destination.longitude),
              zoom: 15.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('DestinationMarker'),
                position: LatLng(destination.latitude, destination.longitude),
                infoWindow: InfoWindow(title: destination.name),
              ),
            },
          ),
        ),
      ),
    );
  }
}
