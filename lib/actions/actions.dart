import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

/// Action for Fetching Load Device /Tracking Data in Monitor Screen.
Future fetchLoadDeviceData(
  BuildContext context, {
  String? filter,
  String? searchValue,
}) async {
  ApiCallResponse? trackingData;

  trackingData = await NewSpeedotrackJSApiGroup.loadDeviceDataApiCall.call(
    jwt: FFAppState().userJwt,
    filter: filter,
    searchval: searchValue,
  );

  if ((trackingData.succeeded ?? true)) {
    FFAppState().listViewScreen = (trackingData.jsonBody ?? '');
  }
}
