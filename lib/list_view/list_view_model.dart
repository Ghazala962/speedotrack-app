import '/backend/api_requests/api_calls.dart';
import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'list_view_widget.dart' show ListViewWidget;
import 'package:flutter/material.dart';

class ListViewModel extends FlutterFlowModel<ListViewWidget> {
  ///  Local state fields for this page.

  bool? showSearch = false;

  String filterValue = 'All';

  bool showIcon = true;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in ListView widget.
  ApiCallResponse? initialPeriodicDeviceDataRes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in Container widget.
  ApiCallResponse? allTrackingDevice;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in Container widget.
  ApiCallResponse? movingTrackingDevice;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in Container widget.
  ApiCallResponse? idleTrackingDevice;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in Container widget.
  ApiCallResponse? stopTrackingDevice;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in Container widget.
  ApiCallResponse? offlineTrackingDevice;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in Container widget.
  ApiCallResponse? expiredTrackingDevice;
  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerComponentModel.dispose();
  }
}
