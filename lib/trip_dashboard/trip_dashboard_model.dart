import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'trip_dashboard_widget.dart' show TripDashboardWidget;
import 'package:flutter/material.dart';

class TripDashboardModel extends FlutterFlowModel<TripDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Devices List)] action in TripDashboard widget.
  ApiCallResponse? devicesListRes;
  // Stores action output result for [Backend Call - API (Util Marker List)] action in TripDashboard widget.
  ApiCallResponse? utilMarkersResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
