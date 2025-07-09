import '/flutter_flow/flutter_flow_util.dart';
import 'update_user_widget.dart' show UpdateUserWidget;
import 'package:flutter/material.dart';

class UpdateUserModel extends FlutterFlowModel<UpdateUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameTextController;
  String? Function(BuildContext, String?)? firstnameTextControllerValidator;
  // State field(s) for Mname widget.
  FocusNode? mnameFocusNode;
  TextEditingController? mnameTextController;
  String? Function(BuildContext, String?)? mnameTextControllerValidator;
  // State field(s) for Lname widget.
  FocusNode? lnameFocusNode;
  TextEditingController? lnameTextController;
  String? Function(BuildContext, String?)? lnameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for Countrycode widget.
  FocusNode? countrycodeFocusNode;
  TextEditingController? countrycodeTextController;
  String? Function(BuildContext, String?)? countrycodeTextControllerValidator;
  // State field(s) for role widget.
  FocusNode? roleFocusNode;
  TextEditingController? roleTextController;
  String? Function(BuildContext, String?)? roleTextControllerValidator;
  // State field(s) for Building widget.
  FocusNode? buildingFocusNode;
  TextEditingController? buildingTextController;
  String? Function(BuildContext, String?)? buildingTextControllerValidator;
  // State field(s) for street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for postal widget.
  FocusNode? postalFocusNode;
  TextEditingController? postalTextController;
  String? Function(BuildContext, String?)? postalTextControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstnameFocusNode?.dispose();
    firstnameTextController?.dispose();

    mnameFocusNode?.dispose();
    mnameTextController?.dispose();

    lnameFocusNode?.dispose();
    lnameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    countrycodeFocusNode?.dispose();
    countrycodeTextController?.dispose();

    roleFocusNode?.dispose();
    roleTextController?.dispose();

    buildingFocusNode?.dispose();
    buildingTextController?.dispose();

    streetFocusNode?.dispose();
    streetTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    postalFocusNode?.dispose();
    postalTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();
  }
}
