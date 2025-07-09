import '/backend/api_requests/api_calls.dart';
import '/components/new_navigation_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'car_list_screen_widget.dart' show CarListScreenWidget;
import 'package:flutter/material.dart';

class CarListScreenModel extends FlutterFlowModel<CarListScreenWidget> {
  ///  Local state fields for this page.

  dynamic vehiclesListData;

  bool isLoading = true;

  String filterValue = 'All';

  String? containsStop = 'Stopped';

  String? selectedDeviceImei = '350544505840549';

  bool showSearch = true;

  String? searchValue;

  bool showExpiredData = true;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Load Device Data Api )] action in CarListScreen widget.
  ApiCallResponse? initialPeriodicDeviceDataRes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    newNavigationMenuModel.dispose();
  }
}
