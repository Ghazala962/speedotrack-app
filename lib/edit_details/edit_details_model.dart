import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_details_widget.dart' show EditDetailsWidget;
import 'package:flutter/material.dart';

class EditDetailsModel extends FlutterFlowModel<EditDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Devicd Edit Api)] action in Text widget.
  ApiCallResponse? deviceUpdate;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for imei widget.
  FocusNode? imeiFocusNode;
  TextEditingController? imeiTextController;
  String? Function(BuildContext, String?)? imeiTextControllerValidator;
  // State field(s) for sim_number widget.
  FocusNode? simNumberFocusNode;
  TextEditingController? simNumberTextController;
  String? Function(BuildContext, String?)? simNumberTextControllerValidator;
  // State field(s) for plate_number widget.
  FocusNode? plateNumberFocusNode;
  TextEditingController? plateNumberTextController;
  String? Function(BuildContext, String?)? plateNumberTextControllerValidator;
  // State field(s) for model widget.
  FocusNode? modelFocusNode;
  TextEditingController? modelTextController;
  String? Function(BuildContext, String?)? modelTextControllerValidator;
  // State field(s) for driverName widget.
  FocusNode? driverNameFocusNode;
  TextEditingController? driverNameTextController;
  String? Function(BuildContext, String?)? driverNameTextControllerValidator;
  // State field(s) for driverPhone widget.
  FocusNode? driverPhoneFocusNode;
  TextEditingController? driverPhoneTextController;
  String? Function(BuildContext, String?)? driverPhoneTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    imeiFocusNode?.dispose();
    imeiTextController?.dispose();

    simNumberFocusNode?.dispose();
    simNumberTextController?.dispose();

    plateNumberFocusNode?.dispose();
    plateNumberTextController?.dispose();

    modelFocusNode?.dispose();
    modelTextController?.dispose();

    driverNameFocusNode?.dispose();
    driverNameTextController?.dispose();

    driverPhoneFocusNode?.dispose();
    driverPhoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
