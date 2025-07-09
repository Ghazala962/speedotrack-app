import '/backend/api_requests/api_calls.dart';
import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'list_view_design_widget.dart' show ListViewDesignWidget;
import 'package:flutter/material.dart';

class ListViewDesignModel extends FlutterFlowModel<ListViewDesignWidget> {
  ///  Local state fields for this page.

  bool isLoadingGeneralInfo = true;

  dynamic liveVehicleTrackingData;

  bool showCard = true;

  String filterValue = 'all';

  bool showSearch = true;

  String? searchValue;

  bool showExpiredData = true;

  bool? isOnlineFilter;

  bool? isOfflineFilter;

  bool? isExpiredFilter;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Group Get API)] action in ListViewDesign widget.
  ApiCallResponse? groupResult;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in ListViewDesign widget.
  ApiCallResponse? initialPeriodicDeviceDataRes;
  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    drawerComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
