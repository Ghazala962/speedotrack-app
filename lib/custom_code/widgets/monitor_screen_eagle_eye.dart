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

import 'index.dart'; // Imports other custom widgets

import '/flutter_flow/flutter_flow_theme.dart'; //
import 'index.dart'; // Imports other custom widgets

import 'package:latlong2/latlong.dart' as coord;
import 'package:flutter_map/flutter_map.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart' as anm;

class MonitorScreenEagleEye extends StatefulWidget {
  const MonitorScreenEagleEye({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<MonitorScreenEagleEye> createState() => _MonitorScreenEagleEyeState();
}

class _MonitorScreenEagleEyeState extends State<MonitorScreenEagleEye>
    with TickerProviderStateMixin {
  late MapController mapController;

  late final _animatedMapController = anm.AnimatedMapController(
    vsync: this,
    duration: Duration(milliseconds: 1000),
    curve: Curves.easeInOut,
  );

  List<dynamic> _deviceListData = [];
  List<dynamic> _trackDeviceList = [];

  late Timer _timer;
  bool enableClustering = true;
  bool switchHybridMap = false;
  bool showMarkers = true;
  bool showMarkerTitle = true;
  bool hasBoundsFitted = false;

  @override
  void initState() {
    /*FFAppState().addListener(() {
      periodicRefresh();
    });*/

    void periodicRefresh() {
      setState(() {
        _deviceListData = [];
        _trackDeviceList = [];

        FFAppState().trackingData['result']?.forEach((group) {
          group['devices']?.forEach((device) {
            _deviceListData.add(device);
          });
        });

        if (FFAppState().selectedDeviceForTrack.length > 0) {
          FFAppState().trackingData['result']?.forEach((group) {
            group['devices']?.forEach((device) {
              _trackDeviceList.add(device);
            });
          });
        }
      });
    }

    periodicRefresh();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      periodicRefresh();

      if (hasBoundsFitted == false) {
        _animatedMapController.centerOnPoint(
            // coord.LatLng(double.parse(widget.historyData[i][1]),
            //     double.parse(widget.historyData[i][2])),
            getCenter(calculateBounds(returnLatLngList())),
            zoom: calculateZoomLevel(
                calculateBounds(returnLatLngList()),
                MediaQuery.of(context).size.width - 62,
                MediaQuery.of(context).size.height - 35));

        hasBoundsFitted = true;
      }
    });
    // _fitMapToBounds();
  }

  //calculate center
  coord.LatLng getCenter(LatLngBounds bounds) {
    double lat = (bounds.southWest!.latitude + bounds.northEast!.latitude) / 2;
    double lng =
        (bounds.southWest!.longitude + bounds.northEast!.longitude) / 2;
    return coord.LatLng(lat, lng);
  }

//calculate zoom level
  double calculateZoomLevel(
      LatLngBounds bounds, double mapWidth, double mapHeight) {
    const double worldWidth =
        256.0; // Width of the world at zoom level 0 in pixels
    const double maxZoom = 18.0; // Maximum zoom level for your map

    double latFraction =
        (bounds.northEast!.latitude - bounds.southWest!.latitude) / 360.0;
    double lngFraction =
        (bounds.northEast!.longitude - bounds.southWest!.longitude) / 360.0;

    double latZoom = log(mapHeight / worldWidth / latFraction) / log(2);
    double lngZoom = log(mapWidth / worldWidth / lngFraction) / log(2);

    return min(min(latZoom, lngZoom), maxZoom);
  }

  // reutrn latLng datatype list.
  List<coord.LatLng> returnLatLngList() {
    return _deviceListData
        .map(
          (device) => coord.LatLng(
            device?['location_data']?['lat'] ?? 0.0,
            device?['location_data']?['lng'] ?? 0.0,
          ),
        )
        .toList();
  }

  List<coord.LatLng> returnTrackLatLngList() {
    return _trackDeviceList
        .map(
          (device) => coord.LatLng(
            device?['location_data']?['lat'] ?? 0.0,
            device?['location_data']?['lng'] ?? 0.0,
          ),
        )
        .toList();
  }

  void _fitMapToBounds() {
    _animatedMapController.centerOnPoint(
        // coord.LatLng(double.parse(widget.historyData[i][1]),
        //     double.parse(widget.historyData[i][2])),
        getCenter(calculateBounds(returnLatLngList())),
        zoom: calculateZoomLevel(
            calculateBounds(returnLatLngList()),
            MediaQuery.of(context).size.width - 625,
            MediaQuery.of(context).size.height - 350));
  }

  //function for calculation the LatLng bound data.
  LatLngBounds calculateBounds(List<coord.LatLng> points) {
    double minLat = points[0].latitude;
    double maxLat = points[0].latitude;
    double minLng = points[0].longitude;
    double maxLng = points[0].longitude;

    for (var point in points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }

    return LatLngBounds(
      coord.LatLng(minLat, minLng),
      coord.LatLng(maxLat, maxLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FlutterMap(
        mapController: _animatedMapController.mapController,
        options: MapOptions(
          center: coord.LatLng(
              FFAppState().trackingData['result'][0]['devices'][0]
                      ['location_data']?['lat'] ??
                  0,
              FFAppState().trackingData['result'][0]['devices'][0]
                      ['location_data']?['lng'] ??
                  0),
          zoom: 5,
          maxZoom: 20,
          minZoom: 2,
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        children: [
          TileLayer(
            urlTemplate: switchHybridMap
                ? 'https://maps.googleapis.com/maps/vt?lyrs=y&x={x}&y={y}&z={z}&key=AIzaSyDfcYU0Ay95IlAyQtEXn_EJMo88dOlZFXM'
                : 'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i{z}!2i{x}!3i{y}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2',
            userAgentPackageName: 'com.speedotrack.app',
          ),
          showMarkers
              ? enableClustering
                  ? MarkerClusterLayerWidget(
                      options: MarkerClusterLayerOptions(
                        maxClusterRadius: 45,
                        size: const Size(40, 40),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(50),
                        maxZoom: 15,
                        markers: _deviceListData
                            .map(
                              (device) => Marker(
                                width: 180,
                                point: coord.LatLng(
                                    device?['location_data']?['lat'] ?? 0.0,
                                    device?['location_data']?['lng'] ?? 0.0),
                                child: showMarkerTitle
                                    ? Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Text(device?['name'] ??
                                                'not found!'),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Transform.rotate(
                                            angle: max(
                                                    0,
                                                    double.parse(
                                                            device?['location_data']
                                                                        ?[
                                                                        'angle']
                                                                    ?.toString() ??
                                                                '0')
                                                        .toDouble()) *
                                                pi /
                                                180,
                                            child: Image.network(
                                              device?['marker'] ??
                                                  'https://speedotrack.in/img/markers/m_5_.png',
                                              height: 80,
                                              width: 80,
                                            ),
                                          )
                                        ],
                                      )
                                    : Transform.rotate(
                                        angle: max(
                                                0,
                                                double.parse(
                                                        device?['location_data']
                                                                    ?['angle']
                                                                ?.toString() ??
                                                            '0')
                                                    .toDouble()) *
                                            pi /
                                            180,
                                        child: Image.network(
                                          device?['marker'] ??
                                              'https://speedotrack.in/img/markers/m_5_.png',
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                              ),
                            )
                            .toList()
                            .cast<Marker>(),
                        builder: (context, markers) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
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
                      markers: _deviceListData
                          .map(
                            (device) => Marker(
                                width: 180,
                                point: coord.LatLng(
                                    device?['location_data']?['lat'] ?? 0.0,
                                    device?['location_data']?['lng'] ?? 0.0),
                                child: showMarkerTitle
                                    ? Container(
                                        child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            width: 500,
                                            color: Colors.white,
                                            child: Text(
                                                device?['name'] ?? 'not found!',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Transform.rotate(
                                            angle: max(
                                                    0,
                                                    double.parse(
                                                            device?['location_data']
                                                                        ?[
                                                                        'angle']
                                                                    ?.toString() ??
                                                                '0')
                                                        .toDouble()) *
                                                pi /
                                                180,
                                            child: Image.network(
                                              device?['marker'] ??
                                                  'https://speedotrack.in/img/markers/m_5_.png',
                                              height: 80,
                                              width: 80,
                                            ),
                                          )
                                        ],
                                      ))
                                    : Transform.rotate(
                                        angle: max(
                                                0,
                                                double.parse(
                                                        device?['location_data']
                                                                    ?['angle']
                                                                ?.toString() ??
                                                            '0')
                                                    .toDouble()) *
                                            pi /
                                            180,
                                        child: Image.network(
                                          device?['marker'] ??
                                              'https://speedotrack.in/img/markers/m_5_.png',
                                          height: 80,
                                          width: 80,
                                        ),
                                      )),
                          )
                          .toList()
                          .cast<Marker>(),
                    )
              : Container()
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      showMarkers = !showMarkers;
                    });
                  },
                  child: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      showMarkerTitle = !showMarkerTitle;
                    });
                  },
                  child: Icon(
                    Icons.text_fields,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      enableClustering = !enableClustering;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _animatedMapController.animatedZoomOut(
                      customId: 'dslkdskl',
                    );
                  },
                  child: Icon(
                    Icons.zoom_out,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _animatedMapController.animatedZoomIn(
                      customId: 'dslkdskl',
                    );
                  },
                  child: Icon(
                    Icons.zoom_in,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      switchHybridMap = !switchHybridMap;
                    });
                  },
                  child: Icon(
                    Icons.map,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _animatedMapController.centerOnPoint(
                        // coord.LatLng(double.parse(widget.historyData[i][1]),
                        //     double.parse(widget.historyData[i][2])),
                        getCenter(calculateBounds(returnLatLngList())),
                        zoom: calculateZoomLevel(
                            calculateBounds(returnLatLngList()),
                            MediaQuery.of(context).size.width - 62,
                            MediaQuery.of(context).size.height - 35));
                  },
                  child: Icon(
                    Icons.fullscreen,
                    color: Colors.grey,
                    size: 18, // Smaller icon size
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
