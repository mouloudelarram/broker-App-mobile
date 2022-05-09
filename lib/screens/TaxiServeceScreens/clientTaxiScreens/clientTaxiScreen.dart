import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:broker/models/Positions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ClientTaxiScreen extends StatefulWidget {
  const ClientTaxiScreen({Key? key}) : super(key: key);

  @override
  _ClientTaxiScreenState createState() => _ClientTaxiScreenState();
}

class _ClientTaxiScreenState extends State<ClientTaxiScreen> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  late double? longitude;
  late double? latitude;
  Set<Marker> _markers = {};

  /* sendPosition(longitude, latitude) async {
    var response = await http.get(
      /* will change this to an other Ip */
      Uri.parse(
          "http://192.168.43.185:8000/position/add/${longitude}/${latitude}"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    var data = json.decode(response.body);
    print('data send to databse are : ');
    print(data);
  }
 */

  sendPosition() {
    http.post(
      Uri.parse(
          "http://192.168.43.185:8000/position/add/${longitude}/${latitude}"),
    );
  }

  removePosition() {
    
    http.post(
      Uri.parse(
          "http://192.168.43.185:8000/position/remove/${longitude}/${latitude}"),
    );
  }

  void getLocation() async {
    //var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          new CameraPosition(
            target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
            zoom: 14.0,
          ),
        ),
      );
      //we need to seed the data to firebase.
      print(
          "**********************************************************************************************");
      print(loc.latitude);
      print(loc.longitude);

      if (longitude == null && latitude == null) {
        longitude = loc.longitude;
        latitude = loc.latitude;
      }

      print(
          "**********************************************************************************************");
      /*  AppConstant.list.add(
        {
          "id": "7",
          "lat": loc.latitude,
          "lon": loc.longitude,
          "title": 'My local position',
        },
      ); */
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  /*  @override
  void initState() {
    super.initState();
    setState(() {
      getLocation();
    });
  } */

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
              initialCameraPosition: CameraPosition(
                target: LatLng(48.8561, 2.2930),
                zoom: 20.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                getLocation();
              },
              markers: _markers,
              mapType: MapType.hybrid,
            ),
          ),
          Positioned(
            bottom: 10,
            left: -50,
            width: w,
            height: h * 0.08,
            child: FloatingActionButton(
              onPressed: sendPosition,
              backgroundColor: Colors.cyan,
              tooltip: 'Google Map',
              child: const Icon(Icons.send),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 50,
            width: w,
            height: h * 0.08,
            child: FloatingActionButton(
              onPressed: removePosition,
              backgroundColor: Colors.cyan,
              tooltip: 'Google Map',
              child: const Icon(Icons.cancel_schedule_send),
            ),
          ),
        ],
      ),
    );
  }
}
