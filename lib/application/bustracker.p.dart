import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:smuctian/data/remote/bustracker.r.dart';

class BusTrackerProvider with ChangeNotifier{
  final BusTrackerRepo repo = BusTrackerRepo();

  LatLng _center =
  const LatLng(23.768806194232265, 90.42511788056092); // Initial map center
  LatLng studentLocation = const LatLng(23.8041, 90.4152); // Initial map center
  LatLng varsity = const LatLng(23.84889486816755, 90.3710037334637);

  LocationData? locationData;

  PermissionStatus? permissionStatus;

  LatLng get center => _center;

  MapController mapController = MapController();
  Location location = Location();


  test() async {
    try {
      bool serviceEnabled;
      PermissionStatus permissionGranted;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          print('service not enabled');
          return;
        }
      }
      print('service is enabled');
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          print('permission is not granted');
          return;
        }
      }
      print('permission is granted');
      // locationData = await location.getLocation();
      location.onLocationChanged.listen((event) {
        locationData = event;
      });

      // locationData = await location.getLocation();
    } catch (e) {
      log(e.toString(), name: 'Location Data not set');
    }
    studentLocation = LatLng(
        locationData?.latitude ?? 23.8041, locationData?.longitude ?? 90.4152);
    mapController.move(_center, 16);
    print('location should have been updated');
    notifyListeners();
  }

  setLocation() async {
    BusLocation? busLocation = null;//await repo.test();


    double lat = double.tryParse(busLocation?.lat ?? '23.768806194232265') ?? 23.768806194232265;
    double long = double.tryParse(busLocation?.long ?? '90.42511788056092') ?? 90.42511788056092;
    print(lat);
    print(long);

    // _center = LatLng(lat, long);
  }
}

class BusLocation {
  // {id: 1, lat: tamim_mostafa, long: backend_ready, name: tamim}
  int? id;
  String? lat;
  String? long;

  BusLocation(this.id, this.lat, this.long);

  BusLocation.fromJson(json) {
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
  }
}
