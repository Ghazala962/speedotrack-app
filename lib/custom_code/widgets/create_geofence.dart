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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

// Package imports
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeofenceHandler {
  final List<gm.LatLng> points = [];
  final Completer<gm.GoogleMapController> controller =
      Completer<gm.GoogleMapController>();
  gm.LatLng? circleCenter;

  Future<Position?> getCurrentLocation(BuildContext context) async {
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
            content: Text("Location permissions are permanently denied.")),
      );
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error getting location: $e")),
      );
      return null;
    }
  }

  void updateAppStatePoints() {
    final validPoints =
        points.where((p) => !p.latitude.isNaN && !p.longitude.isNaN).toList();

    // Only update vertices for polygon mode
    if (FFAppState().geofenceMode == 'polygon') {
      // FIXED: Clear the array first to prevent duplicates
      FFAppState().polygonVertices.clear();

      // Add all points to polygonVertices
      for (int i = 0; i < validPoints.length; i++) {
        FFAppState().polygonVertices.add(
            {"lat": validPoints[i].latitude, "lng": validPoints[i].longitude});
      }

      // Set origin for polygon (first point)
      if (validPoints.isNotEmpty) {
        FFAppState().geofenceOriginLat = validPoints.first.latitude;
        FFAppState().geofenceOriginLng = validPoints.first.longitude;
      }
    } else {
      // Clear vertices for circle mode
      FFAppState().polygonVertices.clear();
    }

    FFAppState().notifyListeners();
  }

  void addPoint(gm.LatLng latLng) {
    if (latLng.latitude.isNaN || latLng.longitude.isNaN) return;
    points.add(latLng);
    updateAppStatePoints();
  }

  void clearPoints() {
    points.clear();
    circleCenter = null;

    // Clear ALL app state data
    FFAppState().polygonVertices.clear();
    FFAppState().geofenceCenter = const LatLng(0.0, 0.0);
    FFAppState().geofenceOriginLat = 0.0;
    FFAppState().geofenceOriginLng = 0.0;
    FFAppState().selectedLatitude = 0.0;
    FFAppState().selectedLongitude = 0.0;

    FFAppState().notifyListeners();
  }

  void setCircleCenter(gm.LatLng center) {
    if (center.latitude.isNaN || center.longitude.isNaN) return;
    circleCenter = center;

    // For circle, set center and origin, but clear vertices
    FFAppState().geofenceCenter = LatLng(center.latitude, center.longitude);
    FFAppState().geofenceOriginLat = center.latitude;
    FFAppState().geofenceOriginLng = center.longitude;

    // IMPORTANT: Clear vertices for circle
    FFAppState().polygonVertices.clear();

    FFAppState().notifyListeners();
  }

  void updateLatLngAppState(gm.LatLng latLng) {
    if (latLng.latitude.isNaN || latLng.longitude.isNaN) {
      FFAppState().selectedLatitude = 0.0;
      FFAppState().selectedLongitude = 0.0;
    } else {
      FFAppState().selectedLatitude = latLng.latitude;
      FFAppState().selectedLongitude = latLng.longitude;
    }
    FFAppState().notifyListeners();
  }

  // FIXED: Method to prepare API data using only polygonVertices
  void prepareForAPICall() {
    print("=== Preparing API Data ===");
    print("Current mode: ${FFAppState().geofenceMode}");

    if (FFAppState().geofenceMode == 'circle') {
      // For circle: clear all vertices data
      FFAppState().polygonVertices.clear();
      print("Cleared vertices for circle mode");

      // Ensure circle center is set
      if (circleCenter != null) {
        FFAppState().geofenceOriginLat = circleCenter!.latitude;
        FFAppState().geofenceOriginLng = circleCenter!.longitude;
        FFAppState().geofenceCenter =
            LatLng(circleCenter!.latitude, circleCenter!.longitude);
      }
    } else if (FFAppState().geofenceMode == 'polygon') {
      // For polygon: ensure vertices are properly formatted
      updateAppStatePoints();

      print("Updated vertices for polygon mode:");
      print("Vertices count: ${FFAppState().polygonVertices.length}");
      print("Vertices data: ${FFAppState().polygonVertices}");
    }

    FFAppState().notifyListeners();
    print("App state updated and ready for API call");
  }

  // FIXED: Enhanced validation method using only polygonVertices
  bool isValidForAPI() {
    print("=== Validation Check ===");
    print("Mode: ${FFAppState().geofenceMode}");

    if (FFAppState().geofenceMode == 'circle') {
      bool valid = circleCenter != null &&
          FFAppState().geofenceOriginLat != 0.0 &&
          FFAppState().geofenceOriginLng != 0.0 &&
          FFAppState().geofenceRadius > 0;

      print("Circle validation:");
      print("- Circle center exists: ${circleCenter != null}");
      print(
          "- Origin lat/lng: ${FFAppState().geofenceOriginLat}, ${FFAppState().geofenceOriginLng}");
      print("- Radius: ${FFAppState().geofenceRadius}");
      print("- Circle valid: $valid");

      // Additional check: ensure no vertices are set for circle
      if (FFAppState().polygonVertices.isNotEmpty) {
        print("WARNING: Circle has vertices - this will cause API error");
        return false;
      }

      return valid;
    } else if (FFAppState().geofenceMode == 'polygon') {
      bool hasEnoughPoints = points.length >= 3;
      bool hasValidOrigin = FFAppState().geofenceOriginLat != 0.0 &&
          FFAppState().geofenceOriginLng != 0.0;
      bool hasValidVertices = FFAppState().polygonVertices.length >= 3;

      print("Polygon validation:");
      print("- Points count: ${points.length} (need >= 3)");
      print(
          "- Origin lat/lng: ${FFAppState().geofenceOriginLat}, ${FFAppState().geofenceOriginLng}");
      print("- Vertices count: ${FFAppState().polygonVertices.length}");

      bool valid = hasEnoughPoints && hasValidOrigin && hasValidVertices;
      print("- Polygon valid: $valid");

      return valid;
    }
    return false;
  }

  // FIXED: Enhanced validation message using only polygonVertices
  String getValidationMessage() {
    if (FFAppState().geofenceMode == 'circle') {
      if (circleCenter == null) {
        return "Please set a center point for the circle";
      }
      if (FFAppState().geofenceRadius <= 0) {
        return "Please set a valid radius for the circle";
      }
      if (FFAppState().polygonVertices.isNotEmpty) {
        return "Circle should not have vertices - please clear and recreate";
      }
      return "Circle is ready for API call";
    } else if (FFAppState().geofenceMode == 'polygon') {
      if (points.length < 3) {
        return "At least three vertices are required for polygon zones. Current: ${points.length}";
      }
      if (FFAppState().geofenceOriginLat == 0.0 ||
          FFAppState().geofenceOriginLng == 0.0) {
        return "Invalid origin coordinates for polygon";
      }
      if (FFAppState().polygonVertices.length < 3) {
        return "Polygon vertices array has insufficient points: ${FFAppState().polygonVertices.length}";
      }
      return "Polygon is ready for API call";
    }
    return "Please select a geofence mode (circle or polygon)";
  }

  // NEW: Method to get debug info for API payload using only polygonVertices
  Map<String, dynamic> getAPIDebugInfo() {
    Map<String, dynamic> debug = {
      "mode": FFAppState().geofenceMode,
      "isValid": isValidForAPI(),
      "validationMessage": getValidationMessage(),
    };

    if (FFAppState().geofenceMode == 'circle') {
      debug.addAll({
        "circle": {
          "centerExists": circleCenter != null,
          "originLat": FFAppState().geofenceOriginLat,
          "originLng": FFAppState().geofenceOriginLng,
          "radius": FFAppState().geofenceRadius,
          "verticesArrayEmpty": FFAppState().polygonVertices.isEmpty,
        }
      });
    } else if (FFAppState().geofenceMode == 'polygon') {
      debug.addAll({
        "polygon": {
          "pointsCount": points.length,
          "originLat": FFAppState().geofenceOriginLat,
          "originLng": FFAppState().geofenceOriginLng,
          "verticesCount": FFAppState().polygonVertices.length,
          "vertices": FFAppState().polygonVertices,
        }
      });
    }

    return debug;
  }
}

class CreateGeofence extends StatefulWidget {
  const CreateGeofence({
    super.key,
    this.width,
    this.height,
    this.name,
    this.color,
    this.visible,
    this.nameVisible,
    this.area,
    this.shape,
    this.radius,
    this.origin_lat,
    this.origin_lng,
    this.group,
    this.vertices_lat,
    this.vertices_lng,
  });

  final double? width;
  final double? height;
  final String? name;
  final String? color;
  final bool? visible;
  final bool? nameVisible;
  final String? area;
  final String? shape;
  final double? radius;
  final double? origin_lat;
  final double? origin_lng;
  final String? group;
  final List<double>? vertices_lat;
  final List<double>? vertices_lng;

  @override
  State<CreateGeofence> createState() => _CreateGeofenceState();
}

class _CreateGeofenceState extends State<CreateGeofence> {
  static const gm.CameraPosition _kGooglePlex = gm.CameraPosition(
    target: gm.LatLng(20.5937, 78.9629),
    zoom: 4,
  );

  final GeofenceHandler _geofenceHandler = GeofenceHandler();
  final TextEditingController _searchController = TextEditingController();
  double _currentZoom = 15.0;
  gm.Marker? _currentLocationMarker;

  @override
  void initState() {
    super.initState();

    // Set initial values from widget parameters
    if (widget.shape != null) {
      FFAppState().geofenceMode = widget.shape!;
    }

    if (widget.radius != null) {
      FFAppState().geofenceRadius = widget.radius!;
    }

    // Set origin if provided
    if (widget.origin_lat != null && widget.origin_lng != null) {
      FFAppState().geofenceOriginLat = widget.origin_lat!;
      FFAppState().geofenceOriginLng = widget.origin_lng!;
    }

    // CRITICAL: Clear vertices immediately for circle mode
    if (FFAppState().geofenceMode == 'circle') {
      FFAppState().polygonVertices.clear();
      FFAppState().notifyListeners();
    }
  }

  Future<void> _searchAndNavigate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isEmpty) return;

      final location = locations.first;
      if (location.latitude.isNaN || location.longitude.isNaN) return;

      final latLng = gm.LatLng(location.latitude, location.longitude);
      final controller = await _geofenceHandler.controller.future;

      controller.animateCamera(
        gm.CameraUpdate.newCameraPosition(
          gm.CameraPosition(target: latLng, zoom: _currentZoom),
        ),
      );

      setState(() {
        if (FFAppState().geofenceMode == 'polygon') {
          _geofenceHandler.addPoint(latLng);
        } else {
          _geofenceHandler.setCircleCenter(latLng);
        }
        _geofenceHandler.updateLatLngAppState(latLng);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error searching location: $e")),
      );
    }
  }

  Future<void> _zoomIn() async {
    final controller = await _geofenceHandler.controller.future;
    _currentZoom = await controller.getZoomLevel();
    setState(() {
      _currentZoom += 1;
    });
    controller.animateCamera(gm.CameraUpdate.zoomTo(_currentZoom));
  }

  Future<void> _zoomOut() async {
    final controller = await _geofenceHandler.controller.future;
    _currentZoom = await controller.getZoomLevel();
    setState(() {
      _currentZoom -= 1;
    });
    controller.animateCamera(gm.CameraUpdate.zoomTo(_currentZoom));
  }

  Future<void> _goToCurrentLocation() async {
    final position = await _geofenceHandler.getCurrentLocation(context);
    if (position == null) return;
    if (position.latitude.isNaN || position.longitude.isNaN) return;

    final latLng = gm.LatLng(position.latitude, position.longitude);
    final controller = await _geofenceHandler.controller.future;

    setState(() {
      _currentLocationMarker = gm.Marker(
        markerId: const gm.MarkerId('current_location'),
        position: latLng,
        icon: gm.BitmapDescriptor.defaultMarkerWithHue(
            gm.BitmapDescriptor.hueBlue),
        infoWindow: const gm.InfoWindow(title: 'Your Location'),
      );
    });

    controller.animateCamera(
      gm.CameraUpdate.newCameraPosition(
        gm.CameraPosition(target: latLng, zoom: _currentZoom),
      ),
    );

    if (FFAppState().geofenceMode == 'polygon') {
      _geofenceHandler.addPoint(latLng);
    } else {
      _geofenceHandler.setCircleCenter(latLng);
    }
    _geofenceHandler.updateLatLngAppState(latLng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          gm.GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (controller) =>
                _geofenceHandler.controller.complete(controller),
            markers: _buildMarkers(),
            polygons: _buildPolygons(),
            circles: _buildCircles(),
            onTap: _handleMapTap,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 56,
            left: 55,
            right: 55,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Address',
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.grey),
                  onPressed: () {
                    _searchAndNavigate(_searchController.text.trim());
                  },
                ),
              ),
              onSubmitted: (value) {
                _searchAndNavigate(value.trim());
              },
            ),
          ),
          Positioned(
            bottom: 24,
            right: 16,
            child: Column(
              children: [
                _buildWhiteButton(
                  icon: Icons.add,
                  heroTag: 'zoomIn',
                  onPressed: _zoomIn,
                ),
                const SizedBox(height: 10),
                _buildWhiteButton(
                  icon: Icons.remove,
                  heroTag: 'zoomOut',
                  onPressed: _zoomOut,
                ),
                const SizedBox(height: 10),
                _buildWhiteButton(
                  icon: Icons.my_location,
                  heroTag: 'currentLocation',
                  onPressed: _goToCurrentLocation,
                ),
                const SizedBox(height: 10),
                _buildWhiteButton(
                  icon: Icons.clear,
                  heroTag: 'clearGeofence',
                  onPressed: () {
                    setState(() {
                      _geofenceHandler.clearPoints();
                      _currentLocationMarker = null;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteButton({
    required IconData icon,
    required String heroTag,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FloatingActionButton(
        heroTag: heroTag,
        mini: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }

  Set<gm.Marker> _buildMarkers() {
    final markers = <gm.Marker>{
      if (FFAppState().geofenceMode == 'polygon')
        ..._geofenceHandler.points
            .where((p) => !p.latitude.isNaN && !p.longitude.isNaN)
            .map((point) => gm.Marker(
                  markerId:
                      gm.MarkerId('point_${point.latitude}_${point.longitude}'),
                  position: point,
                )),
      if (FFAppState().geofenceMode == 'circle' &&
          _geofenceHandler.circleCenter != null &&
          !_geofenceHandler.circleCenter!.latitude.isNaN &&
          !_geofenceHandler.circleCenter!.longitude.isNaN)
        gm.Marker(
          markerId: const gm.MarkerId('circle_center'),
          position: _geofenceHandler.circleCenter!,
        ),
      if (_currentLocationMarker != null) _currentLocationMarker!,
    };
    return markers;
  }

  Set<gm.Polygon> _buildPolygons() {
    final validPoints = _geofenceHandler.points
        .where((p) => !p.latitude.isNaN && !p.longitude.isNaN)
        .toList();

    return {
      if (FFAppState().geofenceMode == 'polygon' && validPoints.length >= 3)
        gm.Polygon(
          polygonId: const gm.PolygonId('geofence_polygon'),
          points: validPoints,
          strokeWidth: 2,
          fillColor: FFAppState().geofenceMainColor.withOpacity(0.2),
          strokeColor: FFAppState().geofenceMainColor,
        ),
    };
  }

  Set<gm.Circle> _buildCircles() {
    return {
      if (FFAppState().geofenceMode == 'circle' &&
          _geofenceHandler.circleCenter != null &&
          !_geofenceHandler.circleCenter!.latitude.isNaN &&
          !_geofenceHandler.circleCenter!.longitude.isNaN)
        gm.Circle(
          circleId: const gm.CircleId('geofence_circle'),
          center: _geofenceHandler.circleCenter!,
          radius: FFAppState().geofenceRadius,
          fillColor: FFAppState().geofenceMainColor.withOpacity(0.1),
          strokeColor: FFAppState().geofenceMainColor,
          strokeWidth: 2,
        ),
    };
  }

  void _handleMapTap(gm.LatLng latLng) {
    if (latLng.latitude.isNaN || latLng.longitude.isNaN) return;

    setState(() {
      if (FFAppState().geofenceMode == 'polygon') {
        _geofenceHandler.addPoint(latLng);
        // Show info about polygon progress
        if (_geofenceHandler.points.length < 3) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Polygon needs ${3 - _geofenceHandler.points.length} more point(s). Current: ${_geofenceHandler.points.length}/3"),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      } else {
        _geofenceHandler.setCircleCenter(latLng);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Circle center set successfully"),
            duration: Duration(seconds: 1),
          ),
        );
      }
      _geofenceHandler.updateLatLngAppState(latLng);
    });
  }
}
