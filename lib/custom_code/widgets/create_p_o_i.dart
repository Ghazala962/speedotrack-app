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
import 'package:latlong2/latlong.dart' as lt;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:typed_data';

class CreatePOI extends StatefulWidget {
  const CreatePOI({
    super.key,
    this.width,
    this.height,
    this.markerColor = Colors.red,
    this.markerIcon,
    this.onVisibilityChanged,
  });

  final double? width;
  final double? height;
  final Color markerColor;
  final FFUploadedFile? markerIcon;
  final Function(bool)? onVisibilityChanged;

  @override
  State<CreatePOI> createState() => _CreatePOIState();
}

class _CreatePOIState extends State<CreatePOI> {
  final MapController _mapController = MapController();
  final double _initialZoom = 2.0;
  final double _searchZoom = 15.0;
  lt.LatLng _currentMarkerPosition = const lt.LatLng(0.0, 0.0);
  bool _markerPlaced = false;

  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with the current app state value
    FFAppState().poiVisible = FFAppState().poiVisible;
  }

  @override
  void dispose() {
    _latController.dispose();
    _lngController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<Position?> _getCurrentLocation() async {
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

  void _updateMarkerPosition(double lat, double lng) {
    setState(() {
      _currentMarkerPosition = lt.LatLng(lat, lng);
      _markerPlaced = true;
      _latController.text = lat.toString();
      _lngController.text = lng.toString();
      FFAppState().selectedLat = lat;
      FFAppState().selectedLng = lng;
    });

    _mapController.move(_currentMarkerPosition, _searchZoom);
  }

  void _zoomIn() {
    _mapController.move(_mapController.center, _mapController.zoom + 1);
  }

  void _zoomOut() {
    _mapController.move(_mapController.center, _mapController.zoom - 1);
  }

  void _togglePOIVisibility() {
    setState(() {
      FFAppState().poiVisible = !FFAppState().poiVisible;
      if (widget.onVisibilityChanged != null) {
        widget.onVisibilityChanged!(FFAppState().poiVisible);
      }
    });
  }

  Future<void> _searchAndNavigate(String place) async {
    if (place.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(place);
      if (locations.isNotEmpty) {
        final location = locations.first;

        // Automatically set POI to visible when searching
        setState(() {
          FFAppState().poiVisible = true;
          if (widget.onVisibilityChanged != null) {
            widget.onVisibilityChanged!(FFAppState().poiVisible);
          }
        });

        _updateMarkerPosition(location.latitude, location.longitude);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No results found for \"$place\"")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error finding location: $e")),
      );
    }
  }

  Widget _buildMarkerIcon() {
    if (widget.markerIcon == null ||
        widget.markerIcon!.bytes == null ||
        widget.markerIcon!.bytes!.isEmpty) {
      return Icon(
        Icons.location_on,
        color: widget.markerColor,
        size: 40,
      );
    }

    try {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: DecorationImage(
            image: MemoryImage(widget.markerIcon!.bytes!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } catch (e) {
      return Icon(
        Icons.location_on,
        color: widget.markerColor,
        size: 40,
      );
    }
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: const lt.LatLng(0.0, 0.0),
              zoom: _initialZoom,
              // Lock map rotation
              interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              onTap: (tapPosition, point) {
                // Automatically set POI to visible when tapping on map
                setState(() {
                  FFAppState().poiVisible = true;
                  if (widget.onVisibilityChanged != null) {
                    widget.onVisibilityChanged!(FFAppState().poiVisible);
                  }
                });
                _updateMarkerPosition(point.latitude, point.longitude);
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i{z}!2i{x}!3i{y}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2',
                userAgentPackageName: 'com.example.app',
              ),
              if (_markerPlaced && FFAppState().poiVisible)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentMarkerPosition,
                      width: 40.0,
                      height: 40.0,
                      child: _buildMarkerIcon(),
                    ),
                  ],
                ),
            ],
          ),

          // Search TextField with clickable search icon
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
                    // Trigger search when icon is tapped
                    _searchAndNavigate(_searchController.text.trim());
                  },
                ),
              ),
              onSubmitted: (value) {
                _searchAndNavigate(value.trim());
              },
            ),
          ),

          // Zoom Buttons
          Positioned(
            bottom: 20,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'zoom_in',
                  mini: true,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.black),
                  onPressed: _zoomIn,
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: 'zoom_out',
                  mini: true,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.remove, color: Colors.black),
                  onPressed: _zoomOut,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
