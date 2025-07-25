import '/flutter_flow/flutter_flow_util.dart';
import 'select_country_code_widget.dart' show SelectCountryCodeWidget;
import 'package:flutter/material.dart';

class SelectCountryCodeModel extends FlutterFlowModel<SelectCountryCodeWidget> {
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
