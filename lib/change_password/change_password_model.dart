import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CurrentPassword widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordTextController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextControllerValidator;
  // State field(s) for OldPassword widget.
  FocusNode? oldPasswordFocusNode;
  TextEditingController? oldPasswordTextController;
  late bool oldPasswordVisibility;
  String? Function(BuildContext, String?)? oldPasswordTextControllerValidator;
  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // Stores action output result for [Backend Call - API (Chnage Pasword )] action in Button widget.
  ApiCallResponse? changePasswordResult;

  @override
  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    oldPasswordVisibility = false;
    newPasswordVisibility = false;
  }

  @override
  void dispose() {
    currentPasswordFocusNode?.dispose();
    currentPasswordTextController?.dispose();

    oldPasswordFocusNode?.dispose();
    oldPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();
  }
}
