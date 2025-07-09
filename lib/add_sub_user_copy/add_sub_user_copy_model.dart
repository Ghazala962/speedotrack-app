import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_sub_user_copy_widget.dart' show AddSubUserCopyWidget;
import 'package:flutter/material.dart';

class AddSubUserCopyModel extends FlutterFlowModel<AddSubUserCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for selectRole widget.
  List<String>? selectRoleValue;
  FormFieldController<List<String>>? selectRoleValueController;
  // State field(s) for nameOfUser widget.
  FocusNode? nameOfUserFocusNode;
  TextEditingController? nameOfUserTextController;
  String? Function(BuildContext, String?)? nameOfUserTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for accountList widget.
  List<String>? accountListValue;
  FormFieldController<List<String>>? accountListValueController;
  // State field(s) for groupList widget.
  List<String>? groupListValue;
  FormFieldController<List<String>>? groupListValueController;
  // State field(s) for vehiclesList widget.
  List<String>? vehiclesListValue;
  FormFieldController<List<String>>? vehiclesListValueController;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    nameOfUserFocusNode?.dispose();
    nameOfUserTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
