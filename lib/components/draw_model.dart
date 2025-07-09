import '/components/expiring_devices_drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'draw_widget.dart' show DrawWidget;
import 'package:flutter/material.dart';

class DrawModel extends FlutterFlowModel<DrawWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ExpiringDevicesDrawer component.
  late ExpiringDevicesDrawerModel expiringDevicesDrawerModel;

  @override
  void initState(BuildContext context) {
    expiringDevicesDrawerModel =
        createModel(context, () => ExpiringDevicesDrawerModel());
  }

  @override
  void dispose() {
    expiringDevicesDrawerModel.dispose();
  }
}
