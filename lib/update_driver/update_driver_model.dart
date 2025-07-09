import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'update_driver_widget.dart' show UpdateDriverWidget;
import 'package:flutter/material.dart';

class UpdateDriverModel extends FlutterFlowModel<UpdateDriverWidget> {
  ///  Local state fields for this page.

  String? joiningDate;

  String? licenseExpiryDate;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_driverImage2 = false;
  FFUploadedFile uploadedLocalFile_driverImage2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Update Driver)] action in Image widget.
  ApiCallResponse? driverImageShow;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for driverName widget.
  FocusNode? driverNameFocusNode;
  TextEditingController? driverNameTextController;
  String? Function(BuildContext, String?)? driverNameTextControllerValidator;
  // State field(s) for phjone widget.
  FocusNode? phjoneFocusNode;
  TextEditingController? phjoneTextController;
  String? Function(BuildContext, String?)? phjoneTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  DateTime? datePicked1;
  bool isDataUploading_testing = false;
  FFUploadedFile uploadedLocalFile_testing =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Update Driver)] action in Image widget.
  ApiCallResponse? icImgShow;
  // State field(s) for icNo widget.
  FocusNode? icNoFocusNode;
  TextEditingController? icNoTextController;
  String? Function(BuildContext, String?)? icNoTextControllerValidator;
  bool isDataUploading_updateImages = false;
  FFUploadedFile uploadedLocalFile_updateImages =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Update Driver)] action in Image widget.
  ApiCallResponse? licenseImgShow;
  // State field(s) for licenseClass widget.
  FocusNode? licenseClassFocusNode;
  TextEditingController? licenseClassTextController;
  String? Function(BuildContext, String?)? licenseClassTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for imei widget.
  String? imeiValue;
  FormFieldController<String>? imeiValueController;
  // Stores action output result for [Backend Call - API (Update Driver)] action in Button widget.
  ApiCallResponse? updateDriverData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    driverNameFocusNode?.dispose();
    driverNameTextController?.dispose();

    phjoneFocusNode?.dispose();
    phjoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    icNoFocusNode?.dispose();
    icNoTextController?.dispose();

    licenseClassFocusNode?.dispose();
    licenseClassTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
