//import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';



class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

const apikey = '';
final homeScaffoldKey=GlobalKey<ScaffoldState>();

class _WidgetPageState extends State<WidgetPage> {
  static const CameraPosition initialCam =
      CameraPosition(target: LatLng(-90.0, -322.0), zoom: 14.2);
  Set<Marker> markersList = {};
  late GoogleMapController googleMapcontroller;
  final Mode _mode = Mode.fullscreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:homeScaffoldKey,
      appBar: AppBar(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCam,
            markers: markersList,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapcontroller = controller;
            },
          ),
          ElevatedButton(
            onPressed: handleButton,
            child: const Text("search "),
          ),
        ],
      ),
    );
  }

  Future<void> handleButton() async {
    Prediction ?p = await PlacesAutocomplete.show(
        context: context,
        apiKey: apikey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: ['hospital'],
        decoration: const InputDecoration(hintText: "search"),components: [Component(Component.country,"sa")]);
        displayPrediction(p!,homeScaffoldKey.currentState);
  }
  void onError(PlacesAutocompleteResponse response){
homeScaffoldKey.currentState!.build(context);//showSnackBar(SnackBar(content: Text(response.errorMessage!),));

  }
  Future<void> displayPrediction(Prediction p,ScaffoldState?currentState) async {

GoogleMapsPlaces places=GoogleMapsPlaces(apiKey: apikey,apiHeaders: await const GoogleApiHeaders().getHeaders());
PlacesDetailsResponse detail=await places.getDetailsByPlaceId(p.placeId!);
final lat=detail.result.geometry!.location.lat;
final lng=detail.result.geometry!.location.lng;
markersList.clear();
markersList.add(Marker(markerId: const MarkerId("0"),position: LatLng(lat,lng),infoWindow: InfoWindow(title:detail.result.name)));
setState(() {

}
);
googleMapcontroller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat,lng),14.0));

  }
}
