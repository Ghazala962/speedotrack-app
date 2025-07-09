import '/flutter_flow/flutter_flow_util.dart';
import 'playback_widget.dart' show PlaybackWidget;
import 'package:flutter/material.dart';

class PlaybackModel extends FlutterFlowModel<PlaybackWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  String? startDate;

  String? endDate;

  String? stopDuration;

  dynamic historyJsonData;

  bool showJourney = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
