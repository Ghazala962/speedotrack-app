import '/components/playback_com_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home15_travel_widget.dart' show Home15TravelWidget;
import 'package:flutter/material.dart';

class Home15TravelModel extends FlutterFlowModel<Home15TravelWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Playback_Com component.
  late PlaybackComModel playbackComModel;

  @override
  void initState(BuildContext context) {
    playbackComModel = createModel(context, () => PlaybackComModel());
  }

  @override
  void dispose() {
    playbackComModel.dispose();
  }
}
