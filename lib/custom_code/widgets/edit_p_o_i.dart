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
import 'dart:developer' as developer;

class EditPOI extends StatefulWidget {
  const EditPOI({
    super.key,
    this.width,
    this.height,
    this.markerColor = Colors.red,
    this.markerIcon,
    required this.initialLat,
    required this.initialLng,
    this.initialImage, // Parameter for initial image
    this.poiName, // Parameter for POI name
  });

  final double? width;
  final double? height;
  final Color markerColor;
  final FFUploadedFile? markerIcon;
  final double initialLat;
  final double initialLng;
  final String? initialImage; // Parameter for initial image URL/string
  final String? poiName; // POI name that will be displayed

  @override
  State<EditPOI> createState() => _EditPOIState();
}

class _EditPOIState extends State<EditPOI> {
  final MapController _mapController = MapController();
  final double _initialZoom = 15.0; // Start zoomed in for editing
  final double _searchZoom = 15.0;
  late lt.LatLng _currentMarkerPosition;
  bool _markerPlaced = true; // Starts with marker placed
  bool _imageLoadError = false;

  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with the provided position
    _currentMarkerPosition = lt.LatLng(widget.initialLat, widget.initialLng);
    _latController.text = widget.initialLat.toString();
    _lngController.text = widget.initialLng.toString();
    FFAppState().selectedLat = widget.initialLat;
    FFAppState().selectedLng = widget.initialLng;

    // Set visibility defaults
    if (FFAppState().isPOIVisible == null) {
      FFAppState().isPOIVisible = true;
    }

    if (FFAppState().isPOINameVisible == null) {
      FFAppState().isPOINameVisible = true;
    }

    // Debug log to verify initial image value
    if (widget.initialImage != null) {
      developer.log('Initial image URL: ${widget.initialImage}');
    }
    if (widget.markerIcon != null) {
      developer.log(
          'Marker icon provided: ${widget.markerIcon!.bytes?.length ?? 0} bytes');
    }
  }

  @override
  void didUpdateWidget(covariant EditPOI oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialLat != widget.initialLat ||
        oldWidget.initialLng != widget.initialLng) {
      _updateMarkerPosition(widget.initialLat, widget.initialLng);
    }

    // Reset image load error flag when image source changes
    if (oldWidget.initialImage != widget.initialImage ||
        oldWidget.markerIcon != widget.markerIcon) {
      setState(() {
        _imageLoadError = false;
      });

      // Debug log for image changes
      developer.log('Image source changed');
      if (widget.initialImage != null) {
        developer.log('New image URL: ${widget.initialImage}');
      }
      if (widget.markerIcon != null) {
        developer.log(
            'New marker icon: ${widget.markerIcon!.bytes?.length ?? 0} bytes');
      }
    }
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

    _mapController.move(
      _currentMarkerPosition,
      _searchZoom,
    );
  }

  void _zoomIn() {
    _mapController.move(
      _mapController.center,
      _mapController.zoom + 1,
    );
  }

  void _zoomOut() {
    _mapController.move(
      _mapController.center,
      _mapController.zoom - 1,
    );
  }

  void _togglePOIVisibility() {
    setState(() {
      FFAppState().isPOIVisible = !FFAppState().isPOIVisible;
    });

    // Show a message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(FFAppState().isPOIVisible
            ? "Points of Interest are now visible"
            : "Points of Interest are now hidden"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _togglePOINameVisibility() {
    setState(() {
      FFAppState().isPOINameVisible = !FFAppState().isPOINameVisible;
    });

    // Show a message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(FFAppState().isPOINameVisible
            ? "POI names are now visible"
            : "POI names are now hidden"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _searchAndNavigate(String place) async {
    if (place.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(place);
      if (locations.isNotEmpty) {
        final location = locations.first;

        // Automatically set POI to visible when searching
        setState(() {
          FFAppState().isPOIVisible = true;
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
    // Default icon as fallback - a red pin similar to the image
    final defaultIcon = Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: Icon(
        Icons.location_on,
        color: widget.markerColor,
        size: 36, // Slightly smaller to ensure it fits
      ),
    );

    // If we already tried loading the image and got an error, use default icon
    if (_imageLoadError) {
      return defaultIcon;
    }

    // Common image container properties
    Widget buildImageContainer(Widget imageWidget) {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.markerColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Container(
            width: 36, // Account for border width
            height: 36,
            child: imageWidget,
          ),
        ),
      );
    }

    // Try to use uploaded marker icon (priority over network image)
    if (widget.markerIcon != null &&
        widget.markerIcon!.bytes != null &&
        widget.markerIcon!.bytes!.isNotEmpty) {
      return buildImageContainer(
        Image.memory(
          widget.markerIcon!.bytes!,
          width: 36,
          height: 36,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: frame != null
                  ? child
                  : Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(widget.markerColor),
                      ),
                    ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            developer.log('Error loading uploaded image: $error');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() => _imageLoadError = true);
            });
            return Center(
              child: Icon(
                Icons.location_on,
                color: widget.markerColor,
                size: 30,
              ),
            );
          },
        ),
      );
    }

    // If no uploaded image or it failed, try the initialImage
    if (widget.initialImage != null && widget.initialImage!.isNotEmpty) {
      return buildImageContainer(
        Image.network(
          widget.initialImage!,
          width: 36,
          height: 36,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(widget.markerColor),
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            developer.log('Error loading network image: $error');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() => _imageLoadError = true);
            });
            return Center(
              child: Icon(
                Icons.location_on,
                color: widget.markerColor,
                size: 30,
              ),
            );
          },
        ),
      );
    }

    return defaultIcon;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _currentMarkerPosition, // Start at the initial position
              zoom: _initialZoom,
              // Lock map rotation
              interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              onTap: (tapPosition, point) {
                // Automatically set POI to visible when tapping on map
                setState(() {
                  FFAppState().isPOIVisible = true;
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
              // Only show the marker if POI visibility is enabled
              if (FFAppState().isPOIVisible)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentMarkerPosition,
                      width: 80.0, // Increased width to accommodate name label
                      height:
                          80.0, // Increased height to accommodate name label
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // POI Name label - only show if name is provided and POI names are visible
                          if (widget.poiName != null &&
                              widget.poiName!.isNotEmpty &&
                              FFAppState().isPOINameVisible)
                            Container(
                              constraints: BoxConstraints(maxWidth: 80),
                              margin: EdgeInsets.only(bottom: 4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: widget.markerColor,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                widget.poiName!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          // Show marker icon with proper constraints
                          Container(
                            width: 40,
                            height: 40,
                            child: _buildMarkerIcon(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Search TextField
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
