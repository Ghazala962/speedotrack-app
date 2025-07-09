import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'start_trip_widget.dart' show StartTripWidget;
import 'package:flutter/material.dart';

class StartTripModel extends FlutterFlowModel<StartTripWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (Start Trip Post API)] action in Button widget.
  ApiCallResponse? startTripResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
