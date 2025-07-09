import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notification_setting_widget.dart' show NotificationSettingWidget;
import 'package:flutter/material.dart';

class NotificationSettingModel
    extends FlutterFlowModel<NotificationSettingWidget> {
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
