import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_groups_widget.dart' show AddGroupsWidget;
import 'package:flutter/material.dart';

class AddGroupsModel extends FlutterFlowModel<AddGroupsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GroupName widget.
  FocusNode? groupNameFocusNode;
  TextEditingController? groupNameTextController;
  String? Function(BuildContext, String?)? groupNameTextControllerValidator;
  // State field(s) for VehicalNumber widget.
  List<String>? vehicalNumberValue;
  FormFieldController<List<String>>? vehicalNumberValueController;
  // Stores action output result for [Backend Call - API (Add Group Api )] action in Button widget.
  ApiCallResponse? addGroupResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    groupNameFocusNode?.dispose();
    groupNameTextController?.dispose();
  }
}
