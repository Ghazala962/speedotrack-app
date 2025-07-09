import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'alarm_notification_widget.dart' show AlarmNotificationWidget;
import 'package:flutter/material.dart';

class AlarmNotificationModel extends FlutterFlowModel<AlarmNotificationWidget> {
  ///  Local state fields for this page.

  bool showSearch = true;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;
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
  // State field(s) for Switch widget.
  bool? switchValue7;
  // State field(s) for Switch widget.
  bool? switchValue8;
  // State field(s) for Switch widget.
  bool? switchValue9;
  // State field(s) for Switch widget.
  bool? switchValue10;
  // State field(s) for Switch widget.
  bool? switchValue11;
  // State field(s) for Switch widget.
  bool? switchValue12;
  // State field(s) for Switch widget.
  bool? switchValue13;
  // State field(s) for Switch widget.
  bool? switchValue14;
  // State field(s) for Switch widget.
  bool? switchValue15;
  // State field(s) for Switch widget.
  bool? switchValue16;
  // State field(s) for Switch widget.
  bool? switchValue17;
  // State field(s) for Switch widget.
  bool? switchValue18;
  // State field(s) for Switch widget.
  bool? switchValue19;
  // State field(s) for Switch widget.
  bool? switchValue20;
  // State field(s) for Switch widget.
  bool? switchValue21;
  // State field(s) for Switch widget.
  bool? switchValue22;
  // State field(s) for Switch widget.
  bool? switchValue23;
  // State field(s) for Switch widget.
  bool? switchValue24;
  // State field(s) for Switch widget.
  bool? switchValue25;
  // State field(s) for Switch widget.
  bool? switchValue26;
  // State field(s) for Switch widget.
  bool? switchValue27;
  // State field(s) for Switch widget.
  bool? switchValue28;
  // State field(s) for Switch widget.
  bool? switchValue29;
  // State field(s) for Switch widget.
  bool? switchValue30;
  // State field(s) for Switch widget.
  bool? switchValue31;
  // State field(s) for Switch widget.
  bool? switchValue32;
  // State field(s) for Switch widget.
  bool? switchValue33;
  // State field(s) for Switch widget.
  bool? switchValue34;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    drawerComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
