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
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animated_marker/flutter_map_animated_marker.dart';
import 'package:latlong2/latlong.dart' as coord;
import 'dart:async';
import 'dart:math';
import 'package:flutter_map_animations/flutter_map_animations.dart' as anm;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaybackFlutterMap extends StatefulWidget {
  const PlaybackFlutterMap({
    super.key,
    this.width,
    this.height,
    required this.historyData,
    required this.stopsData,
    required this.deviceData,
    required this.calenderOpen,
    required this.navigateDetail,
  });

  final double? width;
  final double? height;
  final dynamic historyData;
  final dynamic stopsData;
  final dynamic deviceData;
  final Future Function() calenderOpen;
  final Future Function() navigateDetail;
  @override
  State<PlaybackFlutterMap> createState() => _PlaybackFlutterMapState();
}

class _PlaybackFlutterMapState extends State<PlaybackFlutterMap>
    with TickerProviderStateMixin {
  List<coord.LatLng> polyline = [];
  List<coord.LatLng> stopsArr = [];
  dynamic routeData = [];
  double currentLat = 0.0;
  double currentLng = 0.0;
  String currentDate = '';
  double currentAngle = 0;
  double prevAngle = 0;
  int currentSpeed = 0;
  int i = 0;
  int currentPlaybackIndex = 0;
  String initialAngle = '0';
  bool isPaused = true;
  int playbackSpeed = 1;
  int durationTime = 1000;
  bool isAngleDevice = true;
  String mapType = 'm';
  bool showStops = true;
  bool toggleMap = true;
  bool isInitial = true;
  String listType = 'JOURNEY';
  final dateFormat = DateFormat('dd-MM-yyyy hh:mm:ss a');

  late MapController mapController;
  late final _animatedMapController = anm.AnimatedMapController(
    vsync: this,
    duration: Duration(milliseconds: durationTime),
    curve: Curves.easeInOut,
  );

  // function for playing history data.....
  Future<void> playHistory() async {
    while (i < routeData.length) {
      setState(() {
        prevAngle = currentAngle;
      });

      if (isInitial == true && i > 1) {
        setState(() {
          isInitial = false;
        });
      }

      await Future.delayed(
        Duration(
          milliseconds: playbackSpeed == 1
              ? 1000
              : playbackSpeed == 2
                  ? 500
                  : 300,
        ),
      );

      if (isPaused) continue;

      if (i < routeData.length) {
        setState(() {
          currentLat = routeData[i][1];
          currentLng = routeData[i][2];
          currentAngle = routeData[i][4].toDouble();
          currentDate = routeData[i][0];
          currentSpeed = routeData[i][5];
          i = i + 1;
        });

        if (isInitial == true) {
          _animatedMapController.centerOnPoint(
            getCenter(calculateBounds(polyline)),
            zoom: calculateZoomLevel(
              calculateBounds(polyline),
              MediaQuery.of(context).size.width - 40,
              MediaQuery.of(context).size.height,
            ),
          );
          setState(() {
            isInitial = false;
          });
        }

        _animatedMapController.centerOnPoint(
          coord.LatLng(currentLat, currentLng),
          zoom: playbackSpeed == 1
              ? 22
              : playbackSpeed == 2
                  ? 21
                  : 18.5,
        );
      } else {
        break; // Exit loop if index is out of bounds
      }
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      routeData = widget.historyData['route'];
    });

    for (int j = 0; j < routeData.length; j++) {
      setState(() {
        polyline.add(coord.LatLng(routeData[j][1], routeData[j][2]));
      });
    }

    final bounds = calculateBounds(polyline);

    bool checkAngle() {
      for (int k = 0; k < min(50, routeData.length); k++) {
        if (routeData[k][3] != '0') {
          return true;
        }
      }
      return false;
    }

    if (widget.stopsData.length > 0) {
      for (int l = 0; l < widget.stopsData.length; l++) {
        setState(() {
          stopsArr.add(
            coord.LatLng(
              widget.stopsData[l]['lat'],
              widget.stopsData[l]['lng'],
            ),
          );
        });
      }
    }

    setState(() {
      currentLat = routeData[0][1];
      currentLng = routeData[0][2];
      currentDate = routeData[0][0];
      initialAngle = routeData[0][3].toString();
      isAngleDevice = checkAngle();
      currentAngle = routeData[0][4].toDouble();
    });

    playHistory();
  }

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

  coord.LatLng getCenter(LatLngBounds bounds) {
    double lat = (bounds.southWest!.latitude + bounds.northEast!.latitude) / 2;
    double lng =
        (bounds.southWest!.longitude + bounds.northEast!.longitude) / 2;
    return coord.LatLng(lat, lng);
  }

  double calculateZoomLevel(
    LatLngBounds bounds,
    double mapWidth,
    double mapHeight,
  ) {
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

  void resetRouteData(String routeStart, String routeEnd) {
    final DateTime start = dateFormat.parse(routeStart);
    final DateTime end = dateFormat.parse(routeEnd);

    setState(() {
      routeData = (widget.historyData['route'] as List).where((point) {
        final DateTime pointTime = DateTime.parse(point[0]);
        return pointTime.isAfter(start) && pointTime.isBefore(end);
      }).toList();
      polyline = [];

      for (int j = 0; j < routeData.length; j++) {
        polyline.add(coord.LatLng(routeData[j][1], routeData[j][2]));
      }

      i = 0;
    });
    playHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
            child: FlutterMap(
              mapController: _animatedMapController.mapController,
              options: MapOptions(
                center: coord.LatLng(currentLat, currentLng),
                zoom: 8,
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate: toggleMap
                      ? 'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i{z}!2i{x}!3i{y}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2'
                      : 'https://maps.googleapis.com/maps/vt?lyrs=y&x={x}&y={y}&z={z}&key=AIzaSyDfcYU0Ay95IlAyQtEXn_EJMo88dOlZFXM',
                  userAgentPackageName: 'com.speedotrack.app',
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: polyline,
                      color: Color.fromARGB(255, 4, 173, 195),
                      strokeWidth: 2,
                    ),
                  ],
                ),
                showStops == true && stopsArr.length > 0
                    ? MarkerLayer(
                        markers: stopsArr
                            .map(
                              (stop) => Marker(
                                point: stop,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(58),
                                    ),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'STOP',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 6,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : MarkerLayer(markers: []),
                MarkerLayer(
                  markers: [
                    Marker(
                      height: 100,
                      width: 160,
                      point: coord.LatLng(currentLat, currentLng),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF2DE100),
                              borderRadius: BorderRadius.all(
                                Radius.circular(80),
                              ),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '${widget.deviceData['name']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(68),
                              ),
                              color: Color.fromARGB(142, 4, 173, 195),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Column(
                                  children: [
                                    Transform.rotate(
                                      angle: max(0, currentAngle) * pi / 180,
                                      child: Image.network(
                                        '${widget.deviceData['marker']}',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Marker(
                      point: coord.LatLng(routeData[0][1], routeData[0][2]),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(78)),
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            'START',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                    Marker(
                      point: coord.LatLng(
                        routeData[routeData.length - 1][1],
                        routeData[routeData.length - 1][2],
                      ),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(78)),
                          color: Colors.red,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            'END',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showStops = !showStops;
                      });
                    },
                    child: Container(
                      width: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(
                            'S',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        i = 0;
                      });
                      playHistory();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.refresh_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        toggleMap = !toggleMap;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.layers_outlined, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      launchGoogleMapsStreetView(currentLat, currentLng);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.person_pin_circle_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      _animatedMapController.animatedZoomIn(
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
                        child: Icon(Icons.add, color: Colors.grey, size: 25),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                  setState(() {
                    showStops = !showStops;
                  });
                },
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
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 390.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.deviceData['name']}',
                              style: TextStyle(fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.calenderOpen();
                              },
                              child: Icon(Icons.calendar_month_outlined),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          color: const Color.fromARGB(87, 238, 238, 238),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.historyData['routeLength']} km',
                                        ),
                                        Text(
                                          'Distance',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              89,
                                              89,
                                              89,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.historyData['drivesDuration'].length > 12 ? widget.historyData['drivesDuration'].substring(0, 12) : widget.historyData['drivesDuration']}..',
                                        ),
                                        Text(
                                          'Duration',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              89,
                                              89,
                                              89,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.historyData['engineIdle'].length > 12 ? widget.historyData['engineIdle'].substring(0, 12) : widget.historyData['engineIdle']}..',
                                        ),
                                        Text(
                                          'Idling',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              89,
                                              89,
                                              89,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${widget.historyData['topSpeed']} km/h',
                                          ),
                                          Text(
                                            'Speed',
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                255,
                                                89,
                                                89,
                                                89,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.green,
                                        ),
                                        Container(
                                          height: 35,
                                          child: SizedBox(),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Start ${formatIsoDate(widget.historyData['route'][0][0])}',
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${widget.historyData['startAddress']}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          'End ${formatIsoDate(widget.historyData['route'][widget.historyData['route'].length - 1][0])}',
                                        ),
                                        Text(
                                          '${widget.historyData['endAddress']}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listType = 'JOURNEY';
                                  isPaused = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: listType == 'JOURNEY'
                                        ? Color(0xFF000000)
                                        : Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 44,
                                    ),
                                    child: Text(
                                      'JOURNEY',
                                      style: TextStyle(
                                        color: listType == 'JOURNEY'
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listType = 'TRIP';
                                  isPaused = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: listType == 'TRIP'
                                        ? Color(0xFF000000)
                                        : Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 64,
                                    ),
                                    child: Text(
                                      'TRIP',
                                      style: TextStyle(
                                        color: listType == 'TRIP'
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPaused = !isPaused;
                                    });
                                  },
                                  child: Container(
                                    child: isPaused
                                        ? Icon(
                                            Icons.play_arrow,
                                            color: Color(0xFF04AEC3),
                                          )
                                        : Icon(
                                            Icons.pause,
                                            color: Color(0xFF04AEC3),
                                          ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Slider(
                                  value: i.toDouble(),
                                  activeColor: Color(0xFF04AEC3),
                                  inactiveColor: const Color.fromARGB(
                                    255,
                                    200,
                                    199,
                                    199,
                                  ),
                                  max: routeData.length.toDouble(),
                                  divisions: routeData.length,
                                  onChanged: (double value) {
                                    setState(() {
                                      i = value.toInt();
                                      if (i < routeData.length) {
                                        currentLat = routeData[i][1].toDouble();
                                        currentLng = routeData[i][2].toDouble();
                                        currentAngle =
                                            routeData[i][4].toDouble();
                                        currentDate = routeData[i][0];
                                        currentSpeed = routeData[i][5];
                                      }
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (playbackSpeed == 1) {
                                      setState(() {
                                        playbackSpeed = 2;
                                      });
                                    } else if (playbackSpeed == 2) {
                                      setState(() {
                                        playbackSpeed = 3;
                                      });
                                    } else {
                                      setState(() {
                                        playbackSpeed = 1;
                                      });
                                    }
                                  },
                                  child: Container(
                                    child: Text(
                                      playbackSpeed == 1
                                          ? 'x 1'
                                          : playbackSpeed == 2
                                              ? 'x 2'
                                              : 'x 3',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        isPaused == true
                            ? Container(
                                child: listType == 'JOURNEY'
                                    ? Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children:
                                                (widget.historyData['journey']
                                                        as List)
                                                    .map<Widget>((journey) {
                                              return Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.only(
                                                  bottom: 8,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                              formatIsoDate(journey[
                                                                      'startTime'])
                                                                  .substring(
                                                                      0, 6),
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            Text(
                                                              journey['startTime']
                                                                  .substring(
                                                                      11, 16),
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(
                                                            4.0,
                                                          ),
                                                          child: Image.asset(
                                                            journey['status'] ==
                                                                    'stopped'
                                                                ? 'assets/images/Group_1000005203.png'
                                                                : 'assets/images/moving.png',
                                                            height: 30,
                                                            width: 30,
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${journey['status']} ${journey['duration']}',
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${widget.historyData['drives'].length} TRIPS',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Icon(Icons.info, size: 18),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: (widget.historyData[
                                                        'drives'] as List)
                                                    .map<Widget>((trip) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 2,
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        resetRouteData(
                                                          trip['sts'],
                                                          trip['et'],
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 450,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              10,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                  0x80F1F3F8,
                                                                ),
                                                                border: Border(
                                                                  right:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          16.0,
                                                                      horizontal:
                                                                          10,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          '${trip['sts'].length > 10 ? trip['sts'].substring(0, 10) : trip['sts']}',
                                                                        ),
                                                                        Text(
                                                                          '${trip['sts'].length > 16 ? trip['sts'].substring(11, 16) : trip['sts'].substring(19, 22)}',
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          16.0,
                                                                      horizontal:
                                                                          10,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          '${trip['et'].length > 10 ? trip['et'].substring(0, 10) : trip['et']}',
                                                                        ),
                                                                        Text(
                                                                          '${trip['et'].length > 16 ? trip['et'].substring(11, 16) : trip['et']},',
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 260,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          6.0,
                                                                      horizontal:
                                                                          8,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset(
                                                                              'assets/images/moving.png',
                                                                              height: 25,
                                                                              width: 25,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Text(
                                                                              'Start',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Text(
                                                                              'data',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 3,
                                                                            ),
                                                                            SizedBox(
                                                                              height: 30,
                                                                              child: VerticalDivider(
                                                                                color: Colors.grey,
                                                                                thickness: 1,
                                                                                width: 20,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset(
                                                                              'assets/images/Group_1000005203.png',
                                                                              height: 25,
                                                                              width: 25,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Text(
                                                                              'End',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Text(
                                                                              'data',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              08.0,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              '${trip['rl'].toString().length > 4 ? trip['rl'].toString().substring(0, 4) : trip['rl'].toString()}',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Distance',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                                color: Colors.grey,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              08.0,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              '${trip['dt']}ms',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Duration',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                                color: Colors.grey,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              08.0,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              '${trip['ts']} Km/h',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Max/Speed',
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                                color: Colors.grey,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              )
                            : Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: const Color.fromARGB(
                                          87,
                                          238,
                                          238,
                                          238,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                            horizontal: 4,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      right: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('Time'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      right: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('Km/h'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      right: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('Odometer'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Center(
                                                    child: Text('Status'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: widget
                                              .historyData['route'].length,
                                          itemBuilder: (context, index) {
                                            var route = widget
                                                .historyData['route'][index];

                                            return Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                ),
                                                color: index == i
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .accent1
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          route[0].length > 10
                                                              ? route[0]
                                                                  .substring(
                                                                      2, 10)
                                                              : route[0],
                                                        ),
                                                        Text(
                                                          route[0].length > 19
                                                              ? route[0]
                                                                  .substring(
                                                                      14, 19)
                                                              : '',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                        child: Text(
                                                            '${route[5]}')),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                        child: Text(
                                                            '${route[7]}')),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                          '${route[5] == 0 ? 'Stopped' : 'Moving'}'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )
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
          ),
        ],
      ),
    );
  }
}

String formatIsoDate(String isoDateString) {
  try {
    DateTime parsedDate =
        DateTime.parse(isoDateString).toLocal(); // Convert to local time
    String formattedDate = DateFormat(
      'dd MMMM yyyy, hh:mm a',
    ).format(parsedDate);
    return formattedDate;
  } catch (e) {
    return 'Invalid date';
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
