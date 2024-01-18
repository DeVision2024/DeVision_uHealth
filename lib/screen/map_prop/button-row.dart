import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uhealth/screen/map_prop/place_utils.dart';
import 'package:uhealth/screen/online_consultation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ButtonRowMap extends StatelessWidget {
  const ButtonRowMap({
    Key? key,
  }) : super(key: key);

  //ERROR
  Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status != PermissionStatus.granted) {
      await Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () async {
              try {
                //ERROR MANGGILNYA
                await checkLocationPermission();

                double userLatitude = 37.7749;
                double userLongitude = -122.4194;
                List<Place> nearestHospitals =
                await getNearestHospitals(userLatitude, userLongitude);

                if (nearestHospitals.isNotEmpty) {
                  showRouteToNearestHospital(context, nearestHospitals.first);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('No hospitals found nearby.'),
                  ));
                }
              } catch (e) {
                print('Error occurred: $e');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error occurred while fetching hospitals.'),
                ));
              }
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith((states) => const Color(0xFF4F6F52)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(110, 100)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/img/c 1.png',
                  width: 70,
                  height: 70,
                ),
                Text('Ambulance',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnlineConsultation(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith((states) => const Color(0xFF4F6F52)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(110, 100)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/img/a 2.png',
                  width: 70,
                  height: 70,
                ),
                Container(
                  width: 58,
                  child: Text('Pharmacy Delivery',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //GATAU BENER ATO GA
  void showRouteToNearestHospital(BuildContext context, Place nearestHospital) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapWithRoute(nearestHospital),
      ),
    );
  }
}

class MapWithRoute extends StatelessWidget {
  final Place destination;

  const MapWithRoute(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route to Nearest Hospital'),
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
