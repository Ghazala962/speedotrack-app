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

import 'dart:io';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as lt;
import 'package:cached_network_image/cached_network_image.dart';

class ViewPOI extends StatefulWidget {
  const ViewPOI({
    super.key,
    this.width,
    this.height,
    this.markerColor = Colors.red,
    this.markerIconUrl,
    required this.latitude,
    required this.longitude,
  });

  final double? width;
  final double? height;
  final Color markerColor;
  final String? markerIconUrl;
  final double latitude;
  final double longitude;

  @override
  State<ViewPOI> createState() => _ViewPOIState();
}

class _ViewPOIState extends State<ViewPOI> {
  late lt.LatLng _markerPosition;
  final double _defaultZoom = 15.0;
  final String _mapTileUrl =
      'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i{z}!2i{x}!3i{y}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2';
  final List<String> _subdomains = ['a', 'b', 'c'];

  @override
  void initState() {
    super.initState();
    _markerPosition = lt.LatLng(widget.latitude, widget.longitude);
  }

  @override
  void didUpdateWidget(covariant ViewPOI oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude) {
      setState(() {
        _markerPosition = lt.LatLng(widget.latitude, widget.longitude);
      });
    }
  }

  Widget _buildMarkerIcon(BuildContext context) {
    if (widget.markerIconUrl == null || widget.markerIconUrl!.isEmpty) {
      return Icon(
        Icons.location_on,
        color: Colors.red,
        size: 40,
      );
    }

    return ClipOval(child: _buildImageWidget(widget.markerIconUrl!));
  }

  Widget _buildImageWidget(String imagePath) {
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover,
        width: 40,
        height: 40,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(widget.markerColor),
          ),
        ),
        errorWidget: (context, url, error) {
          print('Error loading network image: $error for URL: $url');
          return _buildDefaultMarkerContent();
        },
      );
    } else if (imagePath.startsWith('assets/') ||
        imagePath.startsWith('static/') ||
        imagePath.contains('img/')) {
      try {
        return Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading asset image: $error, path: $imagePath');
            return _tryAsFileImage(imagePath);
          },
        );
      } catch (e) {
        print('Exception with Image.asset: $e');
        return _tryAsFileImage(imagePath);
      }
    } else {
      return _tryAsFileImage(imagePath);
    }
  }

  Widget _tryAsFileImage(String imagePath) {
    try {
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        width: 40,
        height: 40,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading file image: $error, path: $imagePath');
          return _buildDefaultMarkerContent();
        },
      );
    } catch (e) {
      print('Exception with Image.file: $e');
      return _buildDefaultMarkerContent();
    }
  }

  Widget _buildDefaultMarkerContent() {
    return Icon(
      Icons.location_on,
      color: Colors.red,
      size: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300,
      height: widget.height ?? 300,
      child: FlutterMap(
        options: MapOptions(
          center: _markerPosition,
          zoom: _defaultZoom,
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        children: [
          TileLayer(
            urlTemplate: _mapTileUrl,
            subdomains: _subdomains,
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _markerPosition,
                width: 50.0,
                height: 50.0,
                child: _buildMarkerIcon(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
