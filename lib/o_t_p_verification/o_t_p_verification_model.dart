import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'o_t_p_verification_widget.dart' show OTPVerificationWidget;
import 'package:flutter/material.dart';

class OTPVerificationModel extends FlutterFlowModel<OTPVerificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (OTP Verify )] action in Button widget.
  ApiCallResponse? apiResultco6;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
