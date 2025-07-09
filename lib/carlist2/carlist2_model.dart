import '/backend/api_requests/api_calls.dart';
import '/components/new_navigation_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'carlist2_widget.dart' show Carlist2Widget;
import 'package:flutter/material.dart';

class Carlist2Model extends FlutterFlowModel<Carlist2Widget> {
  ///  Local state fields for this page.

  String filterValue = 'All';

  dynamic vehiclesListData;

  bool isLoading = true;

  String? containsStop = 'Stopped';

  String? selectedDeviceImei = '350544505840549';

  bool showSearch = true;

  bool searchValue = true;

  int? speed;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in carlist2 widget.
  ApiCallResponse? initialPeriodicDeviceDataRes;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for New_Navigation_Menu component.
  late NewNavigationMenuModel newNavigationMenuModel;

  @override
  void initState(BuildContext context) {
    newNavigationMenuModel =
        createModel(context, () => NewNavigationMenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    tabBarController?.dispose();
    newNavigationMenuModel.dispose();
  }
}
