import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'unused_device_list_widget.dart' show UnusedDeviceListWidget;
import 'package:flutter/material.dart';

class UnusedDeviceListModel extends FlutterFlowModel<UnusedDeviceListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
