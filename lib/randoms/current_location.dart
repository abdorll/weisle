import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
  Set<Marker> marker = {};
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(6.518940, 3.391380), zoom: 14);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconOf(Icons.arrow_back_ios_new_rounded, colorPrimary, 20),
        title: TextOf('Current location', 20, FontWeight.w500, white),
        backgroundColor: colorPrimary,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: marker,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await _determinePoition();
            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: LatLng(
                      position.latitude,
                      position.longitude,
                    ),
                    zoom: 14)));
            marker.clear();
            marker.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));
          },
          backgroundColor: colorPrimary,
          icon: IconOf(Icons.location_history, white, 20),
          label: TextOf('My location', 17, FontWeight.w400, white)),
    );
  }

  Future<Position> _determinePoition() async {
    bool serviceEnabled;
    LocationPermission permision;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Weisle error: LOCATION SERVICE ARE DISABLED');
    }
    permision = await Geolocator.checkPermission();

    if (permision == LocationPermission.denied) {
      permision = await Geolocator.requestPermission();
      if (permision == LocationPermission.denied) {
        return Future.error('Location permission are temporarily denied');
      }
    }

    if (permision == LocationPermission.deniedForever) {
      return Future.error('Location permission are permannently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
