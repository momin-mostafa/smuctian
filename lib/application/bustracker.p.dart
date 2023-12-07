import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusTrackerProvider with ChangeNotifier{
  List<LatLng> busLocations = [];
  LatLng? studentCurrentLocation;


  void getUserLocation(){
    // repo call
  }


  void getBusLocations(){
    // repo call
  }
}