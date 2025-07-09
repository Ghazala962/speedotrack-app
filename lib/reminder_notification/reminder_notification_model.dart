import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'reminder_notification_widget.dart' show ReminderNotificationWidget;
import 'package:flutter/material.dart';

class ReminderNotificationModel
    extends FlutterFlowModel<ReminderNotificationWidget> {
  ///  Local state fields for this page.

  bool showSearch = true;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for Switch widget.
  bool? switchValue6;
  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerComponentModel.dispose();
  }
}
