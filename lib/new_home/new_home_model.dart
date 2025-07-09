import '/components/drawer_component_widget.dart';
import '/components/new_navigation_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'new_home_widget.dart' show NewHomeWidget;
import 'package:flutter/material.dart';

class NewHomeModel extends FlutterFlowModel<NewHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    newNavigationMenuModel.dispose();
    drawerComponentModel.dispose();
  }
}
