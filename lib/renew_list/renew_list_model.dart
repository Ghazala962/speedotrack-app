import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'renew_list_widget.dart' show RenewListWidget;
import 'package:flutter/material.dart';

class RenewListModel extends FlutterFlowModel<RenewListWidget> {
  ///  Local state fields for this page.

  String? startDate;

  String? endDate;

  String? selectedDevice;

  ///  State fields for stateful widgets in this page.

  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    drawerComponentModel.dispose();
  }
}
