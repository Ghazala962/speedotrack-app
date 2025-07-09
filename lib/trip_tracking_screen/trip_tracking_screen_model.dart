import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'trip_tracking_screen_widget.dart' show TripTrackingScreenWidget;
import 'package:flutter/material.dart';

class TripTrackingScreenModel
    extends FlutterFlowModel<TripTrackingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Trip Tracking)] action in Trip_Tracking_screen widget.
  ApiCallResponse? tripTrackRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
