// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'index.dart'; // Imports other custom widgets

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as coord;
import 'package:flutter_map_animated_marker/flutter_map_animated_marker.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart' as anm;
import 'dart:async';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/flutter_flow/lat_lng.dart' as flutterFlow;

class FlutterMapWidget extends StatefulWidget {
  FlutterMapWidget({
    super.key,
    this.width,
    this.height,
    required this.selectedDeviceImei,
  });

  final double? width;
  final double? height;
  final String selectedDeviceImei;
  late Timer timer;

  @override
  State<FlutterMapWidget> createState() => _FlutterMapWidgetState();
}

class _FlutterMapWidgetState extends State<FlutterMapWidget>
    with TickerProviderStateMixin {
  late Timer _timer;
  var deviceData;
  List<coord.LatLng> tailData = [];
  dynamic animatedAngle = 0.0;
  String mapType = 'roadmap';
  bool showRoute = true;
  bool switchMap = true;
  String renderMapType = 'roadmap';
  late anm.AnimatedMapController _animatedMapController;
  bool showUser = false;
  String durationVal = '05s';
  Duration updateDuration = Duration(seconds: 5);

  @override
  void initState() {
    super.initState();

    _animatedMapController = anm.AnimatedMapController(
      vsync: this,
      duration: const Duration(seconds: 4),
      curve: Curves.easeInOut,
    );

    deviceData = FFAppState()
        .allDeviceData
        .where((device) => device?['imei'] == widget.selectedDeviceImei)
        .toList();

    void refreshData() {
      deviceData = FFAppState()
          .allDeviceData
          .where((device) => device?['imei'] == widget.selectedDeviceImei)
          .toList();

      setState(() {
        tailData.add(
          coord.LatLng(
            deviceData?[0]['location_data']['lat'] ?? 0.0,
            deviceData?[0]['location_data']['lng'] ?? 0.0,
          ),
        );
        if (tailData.length > 7) {
          tailData.removeAt(0);
        }
        animatedAngle = deviceData?[0]['location_data']['angle'];
      });

      _animatedMapController.centerOnPoint(
        coord.LatLng(
          deviceData?[0]['location_data']['lat'] ?? 0.0,
          deviceData?[0]['location_data']['lng'] ?? 0.0,
        ),
        zoom: _animatedMapController.mapController.zoom,
      );
      _animatedMapController.animatedRotateTo(
        max(
              0,
              double.parse(
                deviceData?[0]['location_data']['angle'].toString() ?? '0',
              ).toDouble(),
            ) *
            pi /
            180,
      );
    }

    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      refreshData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _animatedMapController.mapController,
          options: MapOptions(
            center: coord.LatLng(
              deviceData?[0]['location_data']['lat'] ?? 0.0,
              deviceData?[0]['location_data']['lng'] ?? 0.0,
            ),
            zoom: 17,
          ),
          children: [
            TileLayer(
              urlTemplate: mapType == 'roadmap'
                  ? 'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i{z}!2i{x}!3i{y}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2'
                  : mapType == 'hybrid'
                      ? 'https://maps.googleapis.com/maps/vt?lyrs=y,&x={x}&y={y}&z={z}&key=AIzaSyDfcYU0Ay95IlAyQtEXn_EJMo88dOlZFXM'
                      : 'https://maps.googleapis.com/maps/vt?lyrs=m,traffic&x={x}&y={y}&z={z}&key=AIzaSyDfcYU0Ay95IlAyQtEXn_EJMo88dOlZFXM',
              userAgentPackageName: 'com.edusoft.app',
            ),
            FFAppState().showRouteOnTracking
                ? PolylineLayer(
                    polylines: [
                      Polyline(
                        points: tailData.length > 1
                            ? tailData.sublist(0, tailData.length - 1)
                            : tailData,
                        color: Colors.red,
                        strokeWidth: 5,
                      ),
                    ],
                  )
                : Container(),
            MarkerLayer(
              markers: [
                if (showUser)
                  Marker(
                    height: 60,
                    width: 60,
                    point: coord.LatLng(
                      FFAppState().userLocation?.latitude ?? 0.0,
                      FFAppState().userLocation?.longitude ?? 0.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(68)),
                        color: Color.fromARGB(142, 4, 173, 195),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 4, 96, 195),
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            AnimatedMarkerLayer(
              options: AnimatedMarkerLayerOptions(
                duration: Duration(seconds: 10),
                marker: Marker(
                  height: 125,
                  width: 150,
                  point: coord.LatLng(
                    deviceData?[0]['location_data']['lat'] ?? 0.0,
                    deviceData?[0]['location_data']['lng'] ?? 0.0,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: deviceData?[0]['status'] == 'Stopped'
                                ? Colors.red
                                : deviceData?[0]['status'] == 'Moving'
                                    ? Color(0xFF2DE100)
                                    : deviceData?[0]['status'] == 'Engine idle'
                                        ? Colors.amber
                                        : Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${deviceData?[0]['name'].length > 20 ? deviceData?[0]?['name'].substring(0, 20) + '...' : deviceData?[0]?['name']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(68)),
                            color: Color.fromARGB(142, 4, 173, 195),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Transform.rotate(
                                  angle: (deviceData?[0]?['location_data']
                                              ?['angle'] ??
                                          0.0) *
                                      pi /
                                      180,
                                  child: CachedNetworkImage(
                                    imageUrl: deviceData?[0]?['marker'] ??
                                        'https://speedotrack.in/img/markers/m_5_.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50, 12, 0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (mapType == 'roadmap') {
                        mapType = 'hybrid';
                      } else if (mapType == 'hybrid') {
                        mapType = 'roadmap';
                      } else {
                        mapType = 'roadmap';
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.layers_outlined, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (mapType == 'traffic') {
                        mapType = 'roadmap';
                      } else {
                        mapType = 'traffic';
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.traffic_outlined, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (durationVal == '05s') {
                        durationVal = '10s';
                        updateDuration = Duration(seconds: 10);
                      } else {
                        durationVal = '05s';
                        updateDuration = Duration(seconds: 5);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        durationVal,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    launchGoogleMapsDirections(
                      deviceData?[0]['location_data']['lat'] ?? 0.0,
                      deviceData?[0]['location_data']['lng'] ?? 0.0,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.directions_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (showUser == true) {
                        showUser = false;
                      } else {
                        showUser = true;
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone_android_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    launchGoogleMapsStreetView(
                      deviceData?[0]['location_data']['lat'] ?? 0.0,
                      deviceData?[0]['location_data']['lng'] ?? 0.0,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person_pin_circle_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    _animatedMapController.animatedZoomIn(customId: 'dslkdskl');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add, color: Colors.grey, size: 25),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    _animatedMapController.animatedZoomOut(
                      customId: 'dslkdskl',
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.remove, color: Colors.grey, size: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

launchGoogleMaps(double lat, double lng) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchGoogleMapsStreetView(double lat, double lng) async {
  final url =
      'https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=$lat,$lng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchGoogleMapsDirections(double lat, double lng) async {
  final url =
      'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
