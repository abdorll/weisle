import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';

class CurrenLocation extends StatefulWidget {
  @override
  _CurrenLocationState createState() => _CurrenLocationState();
}

class _CurrenLocationState extends State<CurrenLocation> {
  Position? _currentPosition;
  String? _currentAddress;
//6218E6719312D
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // if (_currentAddress != null)
            //   TextOf(_currentAddress !=null? _currentAddress!:'No addtess found', 20, FontWeight.w400, black),

            ElevatedButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            TextOf(
                _currentAddress != null ? _currentAddress! : 'No addtess found',
                20,
                FontWeight.w400,
                black),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() async {
    //i added starts
    bool isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled() == true;
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    //I added ends
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print('THESE ERRORS OCCURED $e');
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print('ERROR $e');
    }
  }
}
