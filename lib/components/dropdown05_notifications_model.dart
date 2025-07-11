import '/flutter_flow/flutter_flow_util.dart';
import 'dropdown05_notifications_widget.dart'
    show Dropdown05NotificationsWidget;
import 'package:flutter/material.dart';

class Dropdown05NotificationsModel
    extends FlutterFlowModel<Dropdown05NotificationsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
