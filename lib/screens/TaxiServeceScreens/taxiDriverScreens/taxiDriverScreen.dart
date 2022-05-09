import 'package:broker/models/Positions.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class TaxiDriverScreen extends StatefulWidget {
  @override
  _TaxiDriverScreenState createState() => _TaxiDriverScreenState();
}

class _TaxiDriverScreenState extends State<TaxiDriverScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  Iterable markers = [];
  
  final Iterable _markers = Iterable.generate(positions.length, (index) {
    return Marker(
        markerId: MarkerId(positions[index].id.toString()),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(
          positions[index].latitude,
          positions[index].longitude,
        ),
        infoWindow: InfoWindow(title: positions[index].title));
  });

  @override
  void initState() {
    setState(() {
      Position.getData();
      markers = _markers;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: w,
            height: h,
            child: GoogleMap(
              zoomControlsEnabled: false,
              markers: Set.from(markers),
              //polylines: _polylines,
              initialCameraPosition: const CameraPosition(
                bearing: 0,
                tilt: 0,
                zoom: 14,
                target: LatLng(31.50853707915537, -9.763341092159518),
              ),
              myLocationButtonEnabled: true,
              compassEnabled: false,
              mapType: MapType.hybrid,
              onMapCreated: (GoogleMapController controller) {
                
                _controller.complete(controller);
                
                /*  _onMapCreated(controller);
                showLocationPins(); */
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            width: w,
            height: h * 0.08,
            child: FloatingActionButton(
              onPressed: initState,
              backgroundColor: Colors.cyan,
              tooltip: 'Google Map',
              child: const Icon(Icons.pin_drop_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
