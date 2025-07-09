import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'multiple_fleet_widget.dart' show MultipleFleetWidget;
import 'package:flutter/material.dart';

class MultipleFleetModel extends FlutterFlowModel<MultipleFleetWidget> {
  ///  Local state fields for this page.

  bool isLoadingGeneralInfo = true;

  dynamic liveVehicleTrackingData;

  bool showCard = true;

  String filterValue = 'all';

  bool showSearch = true;

  bool showExpiredData = true;

  bool? isOnlineFilter;

  bool? isOfflineFilter;

  bool? isExpiredFilter;

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
