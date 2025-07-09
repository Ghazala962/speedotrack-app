import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_driver_widget.dart' show AddDriverWidget;
import 'package:flutter/material.dart';

class AddDriverModel extends FlutterFlowModel<AddDriverWidget> {
  ///  Local state fields for this page.

  bool? showImage1 = false;

  bool? showImage2;

  bool? showImage3;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_driverImage1 = false;
  FFUploadedFile uploadedLocalFile_driverImage1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
  bool isDataUploading_uploadDataP8aa = false;
  FFUploadedFile uploadedLocalFile_uploadDataP8aa =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for icNo widget.
  FocusNode? icNoFocusNode;
  TextEditingController? icNoTextController;
  String? Function(BuildContext, String?)? icNoTextControllerValidator;
  bool isDataUploading_uploadDataRk33 = false;
  FFUploadedFile uploadedLocalFile_uploadDataRk33 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for licenseClass widget.
  FocusNode? licenseClassFocusNode;
  TextEditingController? licenseClassTextController;
  String? Function(BuildContext, String?)? licenseClassTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for imei widget.
  String? imeiValue;
  FormFieldController<String>? imeiValueController;
  // Stores action output result for [Backend Call - API (Add Driver )] action in Button widget.
  ApiCallResponse? driverAdd;

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
}
