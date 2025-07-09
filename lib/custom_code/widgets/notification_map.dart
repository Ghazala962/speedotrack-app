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

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as coord;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NotificationMap extends StatefulWidget {
  const NotificationMap({
    super.key,
    this.width,
    this.height,
    required this.lat,
    required this.lng,
    required this.name,
  });

  final double? width;
  final double? height;
  final String lat;
  final String lng;
  final String name;

  @override
  State<NotificationMap> createState() => _NotificationMapState();
}

class _NotificationMapState extends State<NotificationMap> {
  String mapType = 'roadmap';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: coord.LatLng(
              double.parse(widget.lat),
              double.parse(widget.lng),
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
            MarkerLayer(
              markers: [
                Marker(
                  height: 125,
                  width: 150,
                  point: coord.LatLng(
                    double.parse(widget.lat),
                    double.parse(widget.lng),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2DE100),
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.name,
                            style: TextStyle(color: Colors.white, fontSize: 10),
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
                                angle: 120,
                                child: CachedNetworkImage(
                                  imageUrl:
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
              ],
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
                    launchGoogleMapsStreetView(
                        double.parse(widget.lat), double.parse(widget.lng));
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
}

Future<void> launchGoogleMapsStreetView(double lat, double lng) async {
  final Uri url = Uri.parse(
      'https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=$lat,$lng');

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
