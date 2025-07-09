import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_device_list_details_widget.dart' show EditDeviceListDetailsWidget;
import 'package:flutter/material.dart';

class EditDeviceListDetailsModel
    extends FlutterFlowModel<EditDeviceListDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for imei widget.
  FocusNode? imeiFocusNode;
  TextEditingController? imeiTextController;
  String? Function(BuildContext, String?)? imeiTextControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for simCardNumber widget.
  FocusNode? simCardNumberFocusNode;
  TextEditingController? simCardNumberTextController;
  String? Function(BuildContext, String?)? simCardNumberTextControllerValidator;
  // State field(s) for expire_date widget.
  FocusNode? expireDateFocusNode;
  TextEditingController? expireDateTextController;
  String? Function(BuildContext, String?)? expireDateTextControllerValidator;
  // State field(s) for protocol widget.
  FocusNode? protocolFocusNode;
  TextEditingController? protocolTextController;
  String? Function(BuildContext, String?)? protocolTextControllerValidator;
  // State field(s) for net_protocol widget.
  FocusNode? netProtocolFocusNode;
  TextEditingController? netProtocolTextController;
  String? Function(BuildContext, String?)? netProtocolTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Backend Call - API (update Device )] action in Button widget.
  ApiCallResponse? updateDevice;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    imeiFocusNode?.dispose();
    imeiTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    simCardNumberFocusNode?.dispose();
    simCardNumberTextController?.dispose();

    expireDateFocusNode?.dispose();
    expireDateTextController?.dispose();

    protocolFocusNode?.dispose();
    protocolTextController?.dispose();

    netProtocolFocusNode?.dispose();
    netProtocolTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
