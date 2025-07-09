import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'schedule_commands_widget.dart' show ScheduleCommandsWidget;
import 'package:flutter/material.dart';

class ScheduleCommandsModel extends FlutterFlowModel<ScheduleCommandsWidget> {
  ///  Local state fields for this page.

  bool? showSearch;

  int pageNo = 1;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
