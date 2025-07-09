import '/flutter_flow/flutter_flow_util.dart';
import 'share_trip_widget.dart' show ShareTripWidget;
import 'package:flutter/material.dart';

class ShareTripModel extends FlutterFlowModel<ShareTripWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
