import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_sub_user_widget.dart' show AddSubUserWidget;
import 'package:flutter/material.dart';

class AddSubUserModel extends FlutterFlowModel<AddSubUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firsrtName widget.
  FocusNode? firsrtNameFocusNode;
  TextEditingController? firsrtNameTextController;
  String? Function(BuildContext, String?)? firsrtNameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for deviceLis widget.
  List<String>? deviceLisValue;
  FormFieldController<List<String>>? deviceLisValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Add Sub User List)] action in Button widget.
  ApiCallResponse? apiResult88e;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firsrtNameFocusNode?.dispose();
    firsrtNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();
  }
}
