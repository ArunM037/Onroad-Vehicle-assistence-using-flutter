import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'Models/polyline_response.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({Key? key}) : super(key: key);

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  static const CameraPosition initialPosition = CameraPosition(target: LatLng(10.416244,  77.900225), zoom: 14);

  final Completer<GoogleMapController> _controller = Completer();

  String totalDistance = "";
  String totalTime = "";

  String apiKey = "AIzaSyChdJJC58YIQv7QHWQ7WN__a_SLwKW0Mic";

  LatLng origin = const LatLng(10.416244, 77.900225);
  LatLng destination = const LatLng(31.5525789, 74.2813495);

  LatLng Mechanic0= const LatLng(10.418198, 77.890298);
  LatLng Mechanic1 = const LatLng(10.406752, 77.912982);
  LatLng Mechanic2= const LatLng(10.417417, 77.925646);
  LatLng Mechanic3 = const LatLng(10.404689, 77.96256);
  LatLng Mechanic4 = const LatLng(10.486755, 77.830691);
  LatLng Mechanic5 = const LatLng(10.496152, 77.747097);

  PolylineResponse polylineResponse = PolylineResponse();

  Set<Polyline> polylinePoints = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mechanic tracking"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            polylines: polylinePoints,
            zoomControlsEnabled: false,
            initialCameraPosition: initialPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(
                markerId: MarkerId('Mechanic1'),
                position: Mechanic0,
                infoWindow: const InfoWindow(
                  title: 'S.Muruga',
                  snippet: '8072198431' ,
                ),
              ),
              Marker(
                  markerId: MarkerId('Mechanic2'),
                  position: Mechanic1,
                infoWindow: const InfoWindow(
                  title: 'Madhav',
                  snippet: '5472800158' ,
                ),
              ),
              Marker(
                  markerId: MarkerId('Mechanic3'),
                  position: Mechanic2,
                infoWindow: const InfoWindow(
                  title: 'Sai',
                  snippet: '1278439001' ,
                ),
              ),
              Marker(
                  markerId: MarkerId('Mechanic4'),
                  position: Mechanic3,
                infoWindow: const InfoWindow(
                  title: 'Deepak',
                  snippet: '5372281965' ,
                ),
              ),
              Marker(
                  markerId: MarkerId('Mechanic5'),
                  position: Mechanic4,
                infoWindow: const InfoWindow(
                  title: 'Sanjay',
                  snippet: '1357496390' ,
                ),
              ),
              Marker(
                markerId: MarkerId('Mechanic6'),
                position: Mechanic5,
                infoWindow: const InfoWindow(
                  title: 'Ravi',
                  snippet: '6381953711' ,
                ),
              ),


            }
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Total Distance: " + totalDistance),
                Text("Total Time: " + totalTime),
              ],
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          drawPolyline();
        },
        child: const Icon(Icons.directions),
      ),
    );
  }

  void drawPolyline() async {
    var response = await http.post(Uri.parse("https://maps.googleapis.com/maps/api/directions/json?key=" +
        apiKey +
        "&units=metric&origin=" +
        origin.latitude.toString() +
        "," +
        origin.longitude.toString() +
        "&destination=" +
        destination.latitude.toString() +
        "," +
        destination.longitude.toString() +
        "&mode=driving"));

    print(response.body);

    polylineResponse = PolylineResponse.fromJson(jsonDecode(response.body));

    totalDistance = polylineResponse.routes![0].legs![0].distance!.text!;
    totalTime = polylineResponse.routes![0].legs![0].duration!.text!;

    for (int i = 0; i < polylineResponse.routes![0].legs![0].steps!.length; i++) {
      polylinePoints.add(Polyline(polylineId: PolylineId(polylineResponse.routes![0].legs![0].steps![i].polyline!.points!), points: [
        LatLng(
            polylineResponse.routes![0].legs![0].steps![i].startLocation!.lat!, polylineResponse.routes![0].legs![0].steps![i].startLocation!.lng!),
        LatLng(polylineResponse.routes![0].legs![0].steps![i].endLocation!.lat!, polylineResponse.routes![0].legs![0].steps![i].endLocation!.lng!),
      ],width: 3,color: Colors.red));
    }

    setState(() {});
  }
}
