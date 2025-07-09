import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'trip_user_lists_widget.dart' show TripUserListsWidget;
import 'package:flutter/material.dart';

class TripUserListsModel extends FlutterFlowModel<TripUserListsWidget> {
  ///  Local state fields for this page.

  bool showSearch = true;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

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
    drawerComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
