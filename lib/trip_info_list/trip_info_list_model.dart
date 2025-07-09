import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'trip_info_list_widget.dart' show TripInfoListWidget;
import 'package:flutter/material.dart';

class TripInfoListModel extends FlutterFlowModel<TripInfoListWidget> {
  ///  Local state fields for this page.

  bool showSearch = true;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Marker List Api)] action in TripInfoList widget.
  ApiCallResponse? apiResultelo;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Report Excel)] action in Icon widget.
  ApiCallResponse? reportExcelResult;
  // Stores action output result for [Backend Call - API (Post Trip Device)] action in Icon widget.
  ApiCallResponse? postTripDeviceResult;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
