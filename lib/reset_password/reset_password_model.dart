import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Reset Password)] action in Button widget.
  ApiCallResponse? forgetPassword;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
