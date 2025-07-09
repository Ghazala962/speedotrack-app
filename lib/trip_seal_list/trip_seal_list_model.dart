import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'trip_seal_list_widget.dart' show TripSealListWidget;
import 'package:flutter/material.dart';

class TripSealListModel extends FlutterFlowModel<TripSealListWidget> {
  ///  Local state fields for this page.

  String? searchVal;

  int? pageNo;

  bool showSearch = true;

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
