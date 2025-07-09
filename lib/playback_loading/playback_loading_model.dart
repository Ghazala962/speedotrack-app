import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'playback_loading_widget.dart' show PlaybackLoadingWidget;
import 'package:flutter/material.dart';

class PlaybackLoadingModel extends FlutterFlowModel<PlaybackLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Playback API )] action in PlaybackLoading widget.
  ApiCallResponse? playbackDataRes;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
