import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  String selectedCountryCode = '+91';

  String selectedCountry = 'India';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for MobileNo widget.
  FocusNode? mobileNoFocusNode;
  TextEditingController? mobileNoTextController;
  String? Function(BuildContext, String?)? mobileNoTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for Confirm widget.
  FocusNode? confirmFocusNode;
  TextEditingController? confirmTextController;
  late bool confirmVisibility;
  String? Function(BuildContext, String?)? confirmTextControllerValidator;
  // Stores action output result for [Backend Call - API (SignUpApi)] action in Button widget.
  ApiCallResponse? signupResult;
  // Stores action output result for [Backend Call - API (Login Api )] action in Button widget.
  ApiCallResponse? loginApiRes;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmVisibility = false;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mobileNoFocusNode?.dispose();
    mobileNoTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmFocusNode?.dispose();
    confirmTextController?.dispose();
  }
}
