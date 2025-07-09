import '/flutter_flow/flutter_flow_util.dart';
import 'add_object_widget.dart' show AddObjectWidget;
import 'package:flutter/material.dart';

class AddObjectModel extends FlutterFlowModel<AddObjectWidget> {
  ///  State fields for stateful widgets in this component.

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
