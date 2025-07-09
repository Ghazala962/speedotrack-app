import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_group_widget.dart' show EditGroupWidget;
import 'package:flutter/material.dart';

class EditGroupModel extends FlutterFlowModel<EditGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GroupName widget.
  FocusNode? groupNameFocusNode;
  TextEditingController? groupNameTextController;
  String? Function(BuildContext, String?)? groupNameTextControllerValidator;
  // State field(s) for VehicalNumber widget.
  List<String>? vehicalNumberValue;
  FormFieldController<List<String>>? vehicalNumberValueController;
  // Stores action output result for [Backend Call - API (Update Group Api)] action in Button widget.
  ApiCallResponse? updateGroupApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    groupNameFocusNode?.dispose();
    groupNameTextController?.dispose();
  }
}
