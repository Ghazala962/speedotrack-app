import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'share_screen_widget.dart' show ShareScreenWidget;
import 'package:flutter/material.dart';

class ShareScreenModel extends FlutterFlowModel<ShareScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for vehicleNo widget.
  FocusNode? vehicleNoFocusNode;
  TextEditingController? vehicleNoTextController;
  String? Function(BuildContext, String?)? vehicleNoTextControllerValidator;
  // State field(s) for Duration widget.
  String? durationValue;
  FormFieldController<String>? durationValueController;
  // Stores action output result for [Backend Call - API (Device Share Api)] action in Button widget.
  ApiCallResponse? deviceShareRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    vehicleNoFocusNode?.dispose();
    vehicleNoTextController?.dispose();
  }
}
