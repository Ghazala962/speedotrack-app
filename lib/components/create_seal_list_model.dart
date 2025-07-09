import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_seal_list_widget.dart' show CreateSealListWidget;
import 'package:flutter/material.dart';

class CreateSealListModel extends FlutterFlowModel<CreateSealListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Post Seal Api)] action in Button widget.
  ApiCallResponse? addSealRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
