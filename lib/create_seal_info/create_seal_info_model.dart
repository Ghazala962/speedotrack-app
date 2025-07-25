import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_seal_info_widget.dart' show CreateSealInfoWidget;
import 'package:flutter/material.dart';

class CreateSealInfoModel extends FlutterFlowModel<CreateSealInfoWidget> {
  ///  State fields for stateful widgets in this page.

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
