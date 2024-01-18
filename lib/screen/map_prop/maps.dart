import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatelessWidget {
  final double height;
  const Maps({Key? key, this.height = 550}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer gmap_controller = Completer();

    const CameraPosition klinik_pratama = CameraPosition(
        target: LatLng(-6.976827313843711, 107.63046512905223), zoom: 17.0);

    Future goToRumahSakit() async {
      final GoogleMapController controller = await gmap_controller.future;
      await controller
          .animateCamera(CameraUpdate.newCameraPosition(klinik_pratama));
    }

    return Container(
      height: height,
      child: FutureBuilder<Position>(
        future: _getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('An error occurred.'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No location data'));
          } else {
            Position currentPosition = snapshot.data!;
            LatLng currentLatLng =
                LatLng(currentPosition.latitude, currentPosition.longitude);

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLatLng,
                zoom: 17.0,
              ),
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                gmap_controller.complete(controller);
              },
              // markers: {
              //   Marker(
              //     markerId: MarkerId('YourMarkerId'),
              //     position: currentLatLng,
              //     infoWindow: InfoWindow(title: 'Your Marker'),
              //   ),
              // },
            );
          }
        },
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    try {
      // Check if permission is granted
      var status = await Permission.location.status;
      if (status == PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        return position;
      } else {
        // If permission is not granted, request it
        var result = await Permission.location.request();
        if (result == PermissionStatus.granted) {
          // If permission is granted after request, get the location
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          return position;
        } else {
          throw 'Location permission not granted';
        }
      }
    } catch (e) {
      print('Error getting location: $e');
      throw e;
    }
  }
}
