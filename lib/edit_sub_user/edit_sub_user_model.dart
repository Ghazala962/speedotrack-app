import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_sub_user_widget.dart' show EditSubUserWidget;
import 'package:flutter/material.dart';

class EditSubUserModel extends FlutterFlowModel<EditSubUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firsrtName widget.
  FocusNode? firsrtNameFocusNode;
  TextEditingController? firsrtNameTextController;
  String? Function(BuildContext, String?)? firsrtNameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for deviceLis widget.
  List<String>? deviceLisValue;
  FormFieldController<List<String>>? deviceLisValueController;
  // Stores action output result for [Backend Call - API (Add Sub User List)] action in Button widget.
  ApiCallResponse? apiResult88e;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firsrtNameFocusNode?.dispose();
    firsrtNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
