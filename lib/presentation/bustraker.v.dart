import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:smuctian/application/bustracker.p.dart';

class BusTracker extends StatelessWidget {
  const BusTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BusTrackerProvider>(builder: (context, controller, _) {
        return Stack(
          children: [
            FlutterMap(
              nonRotatedChildren: const [
                RichAttributionWidget(
                  attributions: [],
                ),
              ],
              options: MapOptions(
                  maxZoom: 17,
                  initialCenter: controller.center,
                  initialZoom: 12,
                  onMapReady: () {
                    controller.mapController.mapEventStream.listen((evt) {});
                    // And any other `MapController` dependent non-movement methods
                  },
                  onTap: (position, latLong) {
                    controller.mapController.move(
                        controller.mapController.center,
                        controller.mapController.zoom + 1);
                  },
                  onLongPress: (position, latLong) {
                    controller.mapController.move(
                        controller.mapController.center,
                        controller.mapController.zoom - 1);
                  }),
              mapController: controller.mapController,
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: controller.varsity,
                      width: 50,
                      height: 50,
                      child: const CampusMarker(),
                    ),
                    Marker(
                      point: controller.center,
                      width: 50,
                      height: 50,
                      child: const BusMarker(),
                    ),
                    Marker(
                      point: controller.studentLocation,
                      width: 80,
                      height: 80,
                      child: const StudentMarker(),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton.filled(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              top: 60,
              left: MediaQuery.sizeOf(context).width * 0.375,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Bus Tracker",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class StudentMarker extends StatelessWidget {
  const StudentMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.location_on,
      color: Colors.red,
    );
  }
}

class BusMarker extends StatelessWidget {
  const BusMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/bus_tracking.png');
  }
}

class CampusMarker extends StatelessWidget {
  const CampusMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/SMUCT_Logo.png');
  }
}
