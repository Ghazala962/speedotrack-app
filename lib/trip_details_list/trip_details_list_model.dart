import '/flutter_flow/flutter_flow_util.dart';
import 'trip_details_list_widget.dart' show TripDetailsListWidget;
import 'package:flutter/material.dart';

class TripDetailsListModel extends FlutterFlowModel<TripDetailsListWidget> {
  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
  }

  @override
  void dispose() {}
}
