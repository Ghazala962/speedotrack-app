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

import 'dart:async'; // Add this import
import 'dart:math' show min, max;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class ViewGeofence extends StatefulWidget {
  const ViewGeofence({
    super.key,
    this.width,
    this.height,
    required this.existingGeofenceId,
    this.vertices = const [],
    this.origin, // Changed from center to origin to match API
    this.radius,
    this.shape, // Added shape parameter
    this.color, // Added color parameter
  });

  final double? width;
  final double? height;
  final String existingGeofenceId;
  final List<dynamic> vertices;
  final dynamic origin; // Changed from LatLng? center to dynamic origin
  final dynamic
      radius; // Changed from double? to dynamic to handle both int and double
  final String? shape; // Added to match the API structure
  final Color? color; // Added color parameter

  @override
  State<ViewGeofence> createState() => _ViewGeofenceState();
}

class _ViewGeofenceState extends State<ViewGeofence> {
  static const gm.CameraPosition _kGooglePlex = gm.CameraPosition(
    target: gm.LatLng(20.5937, 78.9629),
    zoom: 4,
  );

  final Completer<gm.GoogleMapController> _controller =
      Completer<gm.GoogleMapController>();
  bool _mapInitialized = false;
  Set<gm.Polygon> _polygons = {};
  Set<gm.Circle> _circles = {};
  List<gm.LatLng> _points = [];
  gm.LatLng? _circleCenter;
  bool _isCircle = false;
  Color _geofenceColor = Colors.blue; // Default color

  @override
  void initState() {
    super.initState();
    _geofenceColor =
        widget.color ?? Colors.blue; // Use provided color or default
    _initializeGeofence();
  }

  void _initializeGeofence() {
    // Check if shape is explicitly set to circle or determine from properties
    _isCircle = widget.shape == 'circle' ||
        (widget.origin != null &&
            widget.radius != null &&
            (widget.vertices.isEmpty || widget.vertices.length < 3));

    if (!_isCircle) {
      _processVertices();
    } else {
      _processCircle();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  void _processVertices() {
    for (var vertex in widget.vertices) {
      double lat = 0.0;
      double lng = 0.0;
      bool validVertex = false;

      if (vertex is Map<String, dynamic>) {
        lat = _extractDoubleValue(vertex, ['lat', 'latitude']);
        lng = _extractDoubleValue(vertex, ['lng', 'longitude']);
        validVertex = true;
      } else if (vertex is LatLng) {
        lat = vertex.latitude;
        lng = vertex.longitude;
        validVertex = true;
      }

      if (validVertex) {
        _points.add(gm.LatLng(lat, lng));
      }
    }

    if (_points.isNotEmpty) {
      _updatePolygon();
    }
  }

  void _processCircle() {
    // Handle origin in various formats
    if (widget.origin != null) {
      double lat = 0.0;
      double lng = 0.0;

      if (widget.origin is Map<String, dynamic>) {
        lat = _extractDoubleValue(widget.origin, ['lat', 'latitude']);
        lng = _extractDoubleValue(widget.origin, ['lng', 'longitude']);
      } else if (widget.origin is LatLng) {
        lat = widget.origin.latitude;
        lng = widget.origin.longitude;
      }

      _circleCenter = gm.LatLng(lat, lng);
      _updateCircle();
    }
  }

  double _extractDoubleValue(dynamic map, List<String> keys) {
    if (map is! Map<String, dynamic>) return 0.0;

    for (String key in keys) {
      if (map.containsKey(key)) {
        final value = map[key];
        if (value is double) return value;
        if (value is int) return value.toDouble();
        if (value is String) {
          final parsed = double.tryParse(value);
          if (parsed != null) return parsed;
        }
      }
    }
    return 0.0;
  }

  void _updatePolygon() {
    _polygons = {
      if (_points.length >= 3)
        gm.Polygon(
          polygonId: const gm.PolygonId('geofence'),
          points: _points,
          strokeWidth: 2,
          fillColor: _geofenceColor.withOpacity(0.2),
          strokeColor: _geofenceColor,
        ),
    };
  }

  void _updateCircle() {
    _circles = {
      if (_circleCenter != null && widget.radius != null)
        gm.Circle(
          circleId: const gm.CircleId('geofence_circle'),
          center: _circleCenter!,
          radius:
              widget.radius is int ? widget.radius.toDouble() : widget.radius,
          strokeColor: _geofenceColor,
          fillColor: _geofenceColor.withOpacity(0.1),
          strokeWidth: 2,
        ),
    };
  }

  Future<void> _focusOnGeofence(gm.GoogleMapController controller) async {
    if (!_isCircle && _points.isNotEmpty) {
      _focusOnPolygon(controller);
    } else if (_isCircle && _circleCenter != null && widget.radius != null) {
      _focusOnCircle(controller);
    }
  }

  void _focusOnPolygon(gm.GoogleMapController controller) {
    if (_points.length >= 3) {
      final bounds = _calculateBounds(_points);
      controller.animateCamera(gm.CameraUpdate.newLatLngBounds(bounds, 50));
    } else if (_points.isNotEmpty) {
      controller.animateCamera(
        gm.CameraUpdate.newCameraPosition(
          gm.CameraPosition(target: _points.first, zoom: 15),
        ),
      );
    }
  }

  gm.LatLngBounds _calculateBounds(List<gm.LatLng> points) {
    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (final point in points) {
      minLat = min(minLat, point.latitude);
      maxLat = max(maxLat, point.latitude);
      minLng = min(minLng, point.longitude);
      maxLng = max(maxLng, point.longitude);
    }

    return gm.LatLngBounds(
      northeast: gm.LatLng(maxLat, maxLng),
      southwest: gm.LatLng(minLat, minLng),
    );
  }

  void _focusOnCircle(gm.GoogleMapController controller) {
    double radiusValue = widget.radius is int
        ? widget.radius.toDouble()
        : (widget.radius ?? 100.0);

    controller.animateCamera(
      gm.CameraUpdate.newCameraPosition(
        gm.CameraPosition(
          target: _circleCenter!,
          zoom: _calculateZoomLevel(radiusValue),
        ),
      ),
    );
  }

  double _calculateZoomLevel(double radius) {
    if (radius < 100) return 17;
    if (radius < 500) return 15;
    if (radius < 1000) return 14;
    if (radius < 5000) return 12;
    if (radius < 10000) return 10;
    return 8;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Scaffold(
        body: _buildMapWithControls(),
      ),
    );
  }

  Widget _buildMapWithControls() {
    return Stack(
      children: [
        _buildGoogleMap(),
      ],
    );
  }

  Widget _buildGoogleMap() {
    return gm.GoogleMap(
      initialCameraPosition: _kGooglePlex,
      onMapCreated: _onMapCreated,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      compassEnabled: false,
      markers: _buildMarkers(),
      polygons: _polygons,
      circles: _circles,
      onTap: null,
    );
  }

  void _onMapCreated(gm.GoogleMapController controller) {
    _controller.complete(controller);
    if (!_mapInitialized) {
      _mapInitialized = true;
      _focusOnGeofence(controller).then((_) {
        if (mounted) setState(() {});
      });
    }
  }

  Set<gm.Marker> _buildMarkers() {
    final markers = <gm.Marker>{};

    if (!_isCircle) {
      markers.addAll(_points.asMap().entries.map(
            (entry) => gm.Marker(
              markerId: gm.MarkerId('point_${entry.key}'),
              position: entry.value,
              icon: gm.BitmapDescriptor.defaultMarkerWithHue(
                  _getMarkerHue(_geofenceColor)),
            ),
          ));
    } else if (_circleCenter != null) {
      markers.add(gm.Marker(
        markerId: const gm.MarkerId('circle_center'),
        position: _circleCenter!,
        icon: gm.BitmapDescriptor.defaultMarkerWithHue(
            _getMarkerHue(_geofenceColor)),
      ));
    }

    return markers;
  }

  // Helper method to convert Color to marker hue
  double _getMarkerHue(Color color) {
    if (color == Colors.red) return gm.BitmapDescriptor.hueRed;
    if (color == Colors.green) return gm.BitmapDescriptor.hueGreen;
    if (color == Colors.blue) return gm.BitmapDescriptor.hueBlue;
    if (color == Colors.yellow) return gm.BitmapDescriptor.hueYellow;
    if (color == Colors.orange) return gm.BitmapDescriptor.hueOrange;
    if (color == Colors.purple) return gm.BitmapDescriptor.hueViolet;
    if (color == Colors.cyan) return gm.BitmapDescriptor.hueCyan;

    // Default to blue if color doesn't match predefined colors
    return gm.BitmapDescriptor.hueBlue;
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 60,
      left: 16,
      child: FloatingActionButton(
        heroTag: 'backButton_${widget.existingGeofenceId}',
        mini: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
