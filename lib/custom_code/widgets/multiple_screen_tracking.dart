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
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart' as anm;
import 'package:geolocator/geolocator.dart';

class MultipleScreenTracking extends StatefulWidget {
  const MultipleScreenTracking({
    super.key,
    this.width,
    this.height,
    required this.openSidebar,
    required this.changeAccount,
    required this.navigatePlayback,
    required this.navigateTracking,
    required this.launchGoogleMap,
    required this.openShare,
    required this.sidebarIcon,
    required this.changeAccountIcon,
    required this.searchIcon,
    required this.textSearchIcon,
    required this.closeIcon,
  });

  final double? width;
  final double? height;
  final Future Function() openSidebar;
  final Future Function() changeAccount;
  final Future Function(dynamic deviceData) navigatePlayback;
  final Future Function(dynamic deviceData) navigateTracking;
  final Future Function(String lat, String lng) launchGoogleMap;
  final Future Function(dynamic deviceData) openShare;
  final Widget sidebarIcon;
  final Widget changeAccountIcon;
  final Widget searchIcon;
  final Widget textSearchIcon;
  final Widget closeIcon;

  @override
  State<MultipleScreenTracking> createState() => _MultipleScreenTrackingState();
}

class _MultipleScreenTrackingState extends State<MultipleScreenTracking>
    with TickerProviderStateMixin {
  late Timer _timer;
  late Timer _timer2;
  bool enableClustering = true;
  String mapType = 'roadmap';
  bool showTooltip = true;
  bool switchMap = true;
  late final MapController _mapController;
  List<dynamic> devices = [];
  String selectedFilter = 'ALL';
  bool showDetailCard = false;
  dynamic selectedDeviceData;
  late anm.AnimatedMapController _animatedMapController;
  Duration updateDuration = Duration(seconds: 5);
  String durationVal = '05s';
  bool showUser = false;
  bool hideSearch = true;
  bool showOptions = false;
  final TextEditingController _searchController = TextEditingController();
  String? searchVal;
  final FocusNode _focusNode = FocusNode();
  String? selectedDeviceView;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        showOptions = _focusNode.hasFocus;
        print('focus change');
      });
    });

    _mapController = MapController();

    _animatedMapController = anm.AnimatedMapController(
      vsync: this,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await updateDeviceList();

      _fitMapToBounds();
    });

    _timer2 = Timer.periodic(updateDuration, (timer) async {
      await updateDeviceList();
    });
  }

  Future<void> updateDeviceList() async {
    List<dynamic> filteredDevices = [];

    for (int i = 0; i < FFAppState().trackingData?['result'].length; i++) {
      if (selectedDeviceView?.isNotEmpty ?? false) {
        setState(() {
          filteredDevices = [
            ...filteredDevices,
            ...FFAppState().trackingData?['result'][i]['devices'].where(
                  (device) => device['imei'] == selectedDeviceView,
                ),
          ];
        });
      } else {
        if (selectedFilter == 'ALL') {
          setState(() {
            filteredDevices = [
              ...filteredDevices,
              ...FFAppState().trackingData?['result'][i]['devices'],
            ];
          });
        } else if (selectedFilter == 'MOVING') {
          setState(() {
            filteredDevices = [
              ...filteredDevices,
              ...FFAppState().trackingData?['result'][i]['devices'].where(
                    (device) => device['status'] == 'Moving',
                  ),
            ];
          });
        } else if (selectedFilter == 'IDLING') {
          setState(() {
            filteredDevices = [
              ...filteredDevices,
              ...FFAppState().trackingData?['result'][i]['devices'].where(
                    (device) => device['status'] == 'Engine idle',
                  ),
            ];
          });
        } else if (selectedFilter == 'STOP') {
          setState(() {
            filteredDevices = [
              ...filteredDevices,
              ...FFAppState().trackingData?['result'][i]['devices'].where(
                    (device) => device['status'] == 'Stopped',
                  ),
            ];
          });
        } else if (selectedFilter == 'OFFLINE') {
          setState(() {
            filteredDevices = [
              ...filteredDevices,
              ...FFAppState().trackingData?['result'][i]['devices'].where(
                    (device) => device['status'] == 'Offline',
                  ),
            ];
          });
        } else {
          setState(() {
            filteredDevices = [
              ...filteredDevices,
              ...FFAppState().trackingData?['result'][i]['devices'],
            ];
          });
        }
      }
    }
    setState(() {
      devices = filteredDevices;
    });
  }

  void _fitMapToBounds() {
    List<coord.LatLng> allPoints = devices
        .where(
          (vehicle) =>
              vehicle?['location_data']?['lat'] != null &&
              vehicle?['location_data']?['lng'] != null,
        )
        .map<coord.LatLng>(
          (vehicle) => coord.LatLng(
            vehicle['location_data']['lat'],
            vehicle['location_data']['lng'],
          ),
        )
        .toList();

    _animatedMapController.centerOnPoint(
      getCenter(calculateBounds(allPoints)),
      zoom: calculateZoomLevel(
        calculateBounds(allPoints),
        MediaQuery.of(context).size.width - 125,
        MediaQuery.of(context).size.height - 350,
      ),
    );
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

  double calculateZoomLevel(
    LatLngBounds bounds,
    double mapWidth,
    double mapHeight,
  ) {
    const double worldWidth =
        256.0; // Width of the world at zoom level 0 in pixels
    const double maxZoom = 15.0; // Maximum zoom level for your map

    double latFraction =
        (bounds.northEast!.latitude - bounds.southWest!.latitude) / 360.0;
    double lngFraction =
        (bounds.northEast!.longitude - bounds.southWest!.longitude) / 360.0;

    double latZoom = log(mapHeight / worldWidth / latFraction) / log(2);
    double lngZoom = log(mapWidth / worldWidth / lngFraction) / log(2);

    return min(min(latZoom, lngZoom), maxZoom);
  }

  coord.LatLng getCenter(LatLngBounds bounds) {
    double lat = (bounds.southWest!.latitude + bounds.northEast!.latitude) / 2;
    double lng =
        (bounds.southWest!.longitude + bounds.northEast!.longitude) / 2;
    return coord.LatLng(lat, lng);
  }

  Future<Position?> _getCurrentLocation() async {
    // Check and request permission
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location services are disabled.")),
      );
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied.")),
        );
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Location permissions are permanently denied."),
        ),
      );
      return null;
    }

    try {
      // Fetch the current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error getting location: $e")));
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(19, 10, 19, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            widget.openSidebar();
                          },
                          child: widget.sidebarIcon),
                      SizedBox(width: 7),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 12.0), // 👈 adjust the value as needed
                        child: Text(
                          '',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ),
                      hideSearch
                          ? Expanded(
                              child: Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFAppState().userSelfData['username'],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          hideSearch = false;
                                        });
                                      },
                                      child: widget.searchIcon,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  color: Color(0xFFF1F3F8),
                                ),
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 230,
                                        height: 48,
                                        child: TextField(
                                          controller: _searchController,
                                          focusNode: _focusNode,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 10.0,
                                            ),
                                            prefixIcon: widget.textSearchIcon,
                                            hintText: 'Search',
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              searchVal =
                                                  _searchController.text;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      GestureDetector(
                                          onTap: () {
                                            _searchController.clear();
                                            setState(() {
                                              hideSearch = true;
                                              searchVal = null;
                                              showOptions = false;
                                            });
                                            updateDeviceList();
                                          },
                                          child: widget.closeIcon),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(width: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.changeAccount();
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                child: widget.changeAccountIcon),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: showDetailCard == true ? 600 : double.infinity,
                        child: FlutterMap(
                          mapController: _animatedMapController.mapController,
                          options: MapOptions(
                            center: coord.LatLng(0.0, 0.0),
                            zoom: 3,
                            maxZoom: 20,
                            minZoom: 4,
                            interactiveFlags:
                                InteractiveFlag.all & ~InteractiveFlag.rotate,
                            onTap: (tapPosition, latlng) {
                              setState(() {
                                showDetailCard = false;
                              });
                            },
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
                            enableClustering
                                ? MarkerClusterLayerWidget(
                                    options: MarkerClusterLayerOptions(
                                      maxClusterRadius: 45,
                                      size: const Size(50, 50),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(50),
                                      maxZoom: 15,
                                      markers: devices
                                              .map(
                                                (vehicle) => Marker(
                                                  height: 100,
                                                  width: 120,
                                                  point: coord.LatLng(
                                                    vehicle?['location_data']
                                                            ?['lat'] ??
                                                        0.0,
                                                    vehicle?['location_data']
                                                            ?['lng'] ??
                                                        0.0,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        showDetailCard = true;
                                                        selectedDeviceData =
                                                            vehicle;
                                                      });
                                                    },
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: vehicle[
                                                                          'status'] ==
                                                                      'Stopped'
                                                                  ? Colors.red
                                                                  : vehicle['status'] ==
                                                                          'Moving'
                                                                      ? Color(
                                                                          0xFF2DE100,
                                                                        )
                                                                      : vehicle['status'] ==
                                                                              'Engine idle'
                                                                          ? Colors
                                                                              .amber
                                                                          : Colors
                                                                              .grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  80,
                                                                ),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                6.0,
                                                              ),
                                                              child: Text(
                                                                '${vehicle['name'].length > 12 ? vehicle['name'].substring(0, 10) + '...' : vehicle['name']}',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 1,
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  68,
                                                                ),
                                                              ),
                                                              color: Color
                                                                  .fromARGB(
                                                                142,
                                                                4,
                                                                173,
                                                                195,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                10.0,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Transform
                                                                      .rotate(
                                                                    angle: (vehicle?['location_data']?['angle'] ??
                                                                            0.0) *
                                                                        pi /
                                                                        180,
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          vehicle?['marker'] ??
                                                                              'https://speedotrack.in/img/markers/m_5_.png',
                                                                      height:
                                                                          30,
                                                                      width: 30,
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
                                              )
                                              .toList()
                                              .cast<Marker>() ??
                                          [],
                                      builder: (context, markers) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              4,
                                              173,
                                              195,
                                            ),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              markers.length.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : MarkerLayer(
                                    markers: devices
                                            .map(
                                              (vehicle) => Marker(
                                                height: 100,
                                                width: 120,
                                                point: coord.LatLng(
                                                  vehicle?['location_data']
                                                          ?['lat'] ??
                                                      0.0,
                                                  vehicle?['location_data']
                                                          ?['lng'] ??
                                                      0.0,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      showDetailCard = true;
                                                      selectedDeviceData =
                                                          vehicle;
                                                    });
                                                  },
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: vehicle[
                                                                        'status'] ==
                                                                    'Stopped'
                                                                ? Colors.red
                                                                : vehicle['status'] ==
                                                                        'Moving'
                                                                    ? Color(
                                                                        0xFF2DE100,
                                                                      )
                                                                    : vehicle['status'] ==
                                                                            'Engine idle'
                                                                        ? Colors
                                                                            .amber
                                                                        : Colors
                                                                            .grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                80,
                                                              ),
                                                            ),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                              6.0,
                                                            ),
                                                            child: Text(
                                                              '${vehicle['name'].length > 12 ? vehicle['name'].substring(0, 10) + '...' : vehicle['name']}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 1),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                68,
                                                              ),
                                                            ),
                                                            color:
                                                                Color.fromARGB(
                                                              142,
                                                              4,
                                                              173,
                                                              195,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                              10.0,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Transform
                                                                    .rotate(
                                                                  angle: (vehicle?['location_data']
                                                                              ?[
                                                                              'angle'] ??
                                                                          0.0) *
                                                                      pi /
                                                                      180,
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: vehicle?[
                                                                            'marker'] ??
                                                                        'https://speedotrack.in/img/markers/m_5_.png',
                                                                    height: 30,
                                                                    width: 30,
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
                                            )
                                            .toList()
                                            .cast<Marker>() ??
                                        [],
                                  ),
                            MarkerLayer(
                              markers: [
                                if (showUser)
                                  Marker(
                                    height: 60,
                                    width: 60,
                                    point: coord.LatLng(
                                      FFAppState().userLocation?.latitude ??
                                          0.0,
                                      FFAppState().userLocation?.longitude ??
                                          0.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(68),
                                        ),
                                        color: Color.fromARGB(142, 4, 173, 195),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              4,
                                              96,
                                              195,
                                            ),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4,
                                            ),
                                          ),
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
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFilter = 'ALL';
                                        selectedDeviceView = null;
                                      });
                                      updateDeviceList();
                                      _fitMapToBounds();
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: selectedFilter == 'ALL'
                                            ? Color(0xFF04AEC3)
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 16,
                                        ),
                                        child: Text(
                                          'All ${FFAppState().trackingData['total']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: selectedFilter == 'ALL'
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFilter = 'MOVING';
                                        selectedDeviceView = null;
                                      });
                                      updateDeviceList();
                                      _fitMapToBounds();
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: selectedFilter == 'MOVING'
                                            ? Color(0xFF04AEC3)
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          'Moving ${FFAppState().trackingData['moving']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: selectedFilter == 'MOVING'
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFilter = 'IDLING';
                                        selectedDeviceView = null;
                                      });
                                      updateDeviceList();
                                      _fitMapToBounds();
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: selectedFilter == 'IDLING'
                                            ? Color(0xFF04AEC3)
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          'Idling ${FFAppState().trackingData['idle']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: selectedFilter == 'IDLING'
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFilter = 'STOP';
                                        selectedDeviceView = null;
                                      });
                                      updateDeviceList();
                                      _fitMapToBounds();
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: selectedFilter == 'STOP'
                                            ? Color(0xFF04AEC3)
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          'Stop ${FFAppState().trackingData['stopped']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: selectedFilter == 'STOP'
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFilter = 'OFFLINE';
                                        selectedDeviceView = null;
                                      });
                                      updateDeviceList();
                                      _fitMapToBounds();
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: selectedFilter == 'OFFLINE'
                                            ? Color(0xFF04AEC3)
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          'Offline ${FFAppState().trackingData['offline']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: selectedFilter == 'OFFLINE'
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 45, 12, 0),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.layers_outlined,
                                      color: Colors.black,
                                    ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.traffic_outlined,
                                      color: Colors.black,
                                    ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
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
                              SizedBox(height: 150),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
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
                                  setState(() {
                                    enableClustering = !enableClustering;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.fullscreen_exit,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              GestureDetector(
                                onTap: () {
                                  _animatedMapController.animatedZoomIn(
                                    customId: 'dslkdskl',
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(80),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      showDetailCard == true
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(18),
                                    topLeft: Radius.circular(18),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: const Color.fromARGB(
                                          203,
                                          238,
                                          238,
                                          238,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                child: Image.asset(
                                                  'assets/images/Group_1000005203.png',
                                                  width: 60,
                                                  height: 60,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${selectedDeviceData?['name'] ?? 'unknown device'}',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${selectedDeviceData?['prot'] ?? 'unknown device'}',
                                                      style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                          255,
                                                          119,
                                                          118,
                                                          118,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${selectedDeviceData?['device_driver']?['name'] ?? 'not found!'}',
                                                      style: TextStyle(
                                                        color: const Color
                                                            .fromARGB(
                                                          255,
                                                          119,
                                                          118,
                                                          118,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    left: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 6.0,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        '${selectedDeviceData?['location_data']['speed'] ?? 'not found!'}',
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        'km/h',
                                                        style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(
                                                            255,
                                                            119,
                                                            118,
                                                            118,
                                                          ),
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
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            '${selectedDeviceData?['location_data']['dt_tracker'] ?? 'not found !'}',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${(selectedDeviceData?['address'] != null) ? (selectedDeviceData!['address'].length > 35 ? '${selectedDeviceData['address'].substring(0, 45)}...' : selectedDeviceData['address']) : 'not found !'}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12.0,
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children:
                                                (selectedDeviceData?['sensors']
                                                            as List<dynamic>? ??
                                                        [])
                                                    .map((sensor) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                ), // spacing between boxes
                                                color: const Color.fromARGB(
                                                  224,
                                                  238,
                                                  238,
                                                  238,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 25,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Image.network(
                                                        sensor['icon'] ??
                                                            'https://gps.speedotrack.com/img/images/engine.png', // fallback icon
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        sensor['valueFull'] ??
                                                            'n/a',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                widget.navigateTracking(
                                                    selectedDeviceData);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        189,
                                                        189,
                                                        189,
                                                      ),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(60),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6.0,
                                                    horizontal: 10,
                                                  ),
                                                  child: Text(
                                                    'Tracking',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        123,
                                                        123,
                                                        123,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                widget.navigatePlayback(
                                                    selectedDeviceData);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        189,
                                                        189,
                                                        189,
                                                      ),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(60),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6.0,
                                                    horizontal: 10,
                                                  ),
                                                  child: Text(
                                                    'Playback',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        123,
                                                        123,
                                                        123,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                widget.launchGoogleMap(
                                                    selectedDeviceData[
                                                                'location_data']
                                                            ['lat'] ??
                                                        0.0,
                                                    selectedDeviceData[
                                                                'location_data']
                                                            ['lat'] ??
                                                        0.0);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        189,
                                                        189,
                                                        189,
                                                      ),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(60),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6.0,
                                                    horizontal: 10,
                                                  ),
                                                  child: Text(
                                                    'Navigate',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        123,
                                                        123,
                                                        123,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                widget.openShare(
                                                    selectedDeviceData);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        189,
                                                        189,
                                                        189,
                                                      ),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(60),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6.0,
                                                    horizontal: 10,
                                                  ),
                                                  child: Text(
                                                    'Share',
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                        255,
                                                        123,
                                                        123,
                                                        123,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(height: 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (showOptions && !hideSearch)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Container(
                  color: Colors.white,
                  height: 260,
                  width: 280,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: FFAppState().allDeviceData.where((device) {
                          final imei =
                              device['imei']?.toString().toLowerCase() ?? '';
                          final name =
                              device['name']?.toString().toLowerCase() ?? '';
                          final query = searchVal?.toLowerCase() ?? '';
                          return query.isEmpty ||
                              imei.contains(query) ||
                              name.contains(query);
                        }).map<Widget>((device) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDeviceView = device['imei'];
                                selectedFilter = 'ALL';
                                showOptions = false;
                                hideSearch = true;
                              });
                              updateDeviceList();
                              _fitMapToBounds();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '${device['name'] ?? 'Unknown Device'}',
                              ),
                            ),
                          );
                        }).toList(),
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
