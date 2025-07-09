import '/components/drawer_component_widget.dart';
import '/components/new_navigation_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alert_screen_widget.dart' show AlertScreenWidget;
import 'package:flutter/material.dart';

class AlertScreenModel extends FlutterFlowModel<AlertScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for New_Navigation_Menu component.
  late NewNavigationMenuModel newNavigationMenuModel;
  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;

  @override
  void initState(BuildContext context) {
    newNavigationMenuModel =
        createModel(context, () => NewNavigationMenuModel());
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    newNavigationMenuModel.dispose();
    drawerComponentModel.dispose();
  }
}
