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

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as coord;
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AllTripTracking extends StatefulWidget {
  AllTripTracking({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<AllTripTracking> createState() => _AllTripTrackingState();
}

class _AllTripTrackingState extends State<AllTripTracking> {
  dynamic deviceListData;
  late Timer _timer;
  bool enableClustering = true;
  String mapType = 'm';
  bool showTooltip = true;
  bool switchMap = true;
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    updateDeviceList();
    _timer = Timer.periodic(const Duration(seconds: 40), (timer) {
      updateDeviceList();
    });
  }

  void updateDeviceList() {
    setState(() {
      deviceListData = FFAppState().AllTripTracking;
    });

    if (deviceListData != null && deviceListData.isNotEmpty) {
      _fitMapToBounds();
    }

    print(jsonEncode(deviceListData));
  }

  void _fitMapToBounds() {
    List<coord.LatLng> allPoints = deviceListData
            ?.map<coord.LatLng>(
              (vehicle) => coord.LatLng(
                vehicle?['lat'] ?? 0.0,
                vehicle?['lng'] ?? 0.0,
              ),
            )
            .toList() ??
        [];

    if (allPoints.isNotEmpty) {
      var latitudes = allPoints.map((point) => point.latitude);
      var longitudes = allPoints.map((point) => point.longitude);

      var southWest =
          coord.LatLng(latitudes.reduce(min), longitudes.reduce(min));
      var northEast =
          coord.LatLng(latitudes.reduce(max), longitudes.reduce(max));

      LatLngBounds bounds = LatLngBounds(southWest, northEast);

      _mapController.fitBounds(bounds,
          options: const FitBoundsOptions(padding: EdgeInsets.all(50)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: (deviceListData != null && deviceListData.isNotEmpty)
                ? coord.LatLng(
                    deviceListData[0]['lat'] ?? 0.0,
                    deviceListData[0]['lng'] ?? 0.0,
                  )
                : coord.LatLng(0.0, 0.0),
            zoom: 7,
            maxZoom: 20,
            minZoom: 4,
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
          children: [
            TileLayer(
              urlTemplate: switchMap
                  ? 'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i{z}!2i{x}!3i{y}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2'
                  : 'https://maps.googleapis.com/maps/vt?lyrs=y&x={x}&y={y}&z={z}&key=AIzaSyDfcYU0Ay95IlAyQtEXn_EJMo88dOlZFXM',
              userAgentPackageName: 'com.speedotrack.app',
            ),
            enableClustering
                ? MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 45,
                      size: const Size(40, 40),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(50),
                      maxZoom: 15,
                      markers: deviceListData
                              ?.map((vehicle) => Marker(
                                  height: 95,
                                  width: 150,
                                  point: coord.LatLng(vehicle?['lat'] ?? 0.0,
                                      vehicle?['lng'] ?? 0.0),
                                  child: Container(
                                      child: Column(
                                    children: [
                                      showTooltip
                                          ? Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  vehicle?['name'].toString() ??
                                                      'Vehicle Name',
                                                  /* style: TextStyle(
                                                    color: vehicle?['st']
                                                                .toString() ==
                                                            "Engine idle"
                                                        ? Colors.yellow
                                                        : vehicle?['st']
                                                                    .toString() ==
                                                                "Stopped"
                                                            ? Colors.red
                                                            : vehicle?['st']
                                                                        .toString() ==
                                                                    "Moving"
                                                                ? Colors.green
                                                                : Colors.black,
                                                  ),*/
                                                ),
                                              ))
                                          : Container(),
                                      const SizedBox(height: 1),
                                      Transform.rotate(
                                        angle: (vehicle?['angle'] ?? 0.0) *
                                            pi /
                                            180,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://speedotrack.in/img/markers/m_5_.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ],
                                  ))))
                              .toList()
                              .cast<Marker>() ??
                          [],
                      builder: (context, markers) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue),
                          child: Center(
                            child: Text(
                              markers.length.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : MarkerLayer(
                    markers: deviceListData
                            ?.map((vehicle) => Marker(
                                height: 80,
                                width: 120,
                                point: coord.LatLng(vehicle?['lat'] ?? 0.0,
                                    vehicle?['lng'] ?? 0.0),
                                child: Container(
                                    child: Column(
                                  children: [
                                    showTooltip
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                vehicle?['name'].toString() ??
                                                    'Vehicle Name',
                                                /* style: TextStyle(
                                                  color: vehicle?['st']
                                                              .toString() ==
                                                          "Engine idle"
                                                      ? Colors.yellow
                                                      : vehicle?['st']
                                                                  .toString() ==
                                                              "Stopped"
                                                          ? Colors.red
                                                          : vehicle?['st']
                                                                      .toString() ==
                                                                  "Moving"
                                                              ? Colors.green
                                                              : Colors.black,
                                                ),*/
                                              ),
                                            ))
                                        : Container(),
                                    const SizedBox(height: 1),
                                    Transform.rotate(
                                      angle:
                                          (vehicle?['angle'] ?? 0.0) * pi / 180,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://speedotrack.in/img/markers/m_5_.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ],
                                ))))
                            .toList()
                            .cast<Marker>() ??
                        [],
                  )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      enableClustering = !enableClustering;
                    });
                  },
                  child: const Icon(
                    Icons.streetview,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      switchMap = !switchMap;
                    });
                  },
                  child: const Icon(Icons.map, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      showTooltip = !showTooltip;
                    });
                  },
                  child: const Icon(Icons.message, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
