import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'trip_names_list_widget.dart' show TripNamesListWidget;
import 'package:flutter/material.dart';

class TripNamesListModel extends FlutterFlowModel<TripNamesListWidget> {
  ///  Local state fields for this page.

  bool showSearch = true;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

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
