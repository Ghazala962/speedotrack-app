import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_geofence_widget.dart' show AddGeofenceWidget;
import 'package:flutter/material.dart';

class AddGeofenceModel extends FlutterFlowModel<AddGeofenceWidget> {
  ///  Local state fields for this page.

  bool isLoadingGeneralInfo = true;

  dynamic liveVehicleTrackingData;

  bool showCard = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for namepoly widget.
  FocusNode? namepolyFocusNode;
  TextEditingController? namepolyTextController;
  String? Function(BuildContext, String?)? namepolyTextControllerValidator;
  // State field(s) for group widget.
  String? groupValue;
  FormFieldController<String>? groupValueController;
  // State field(s) for grouppoly widget.
  String? grouppolyValue;
  FormFieldController<String>? grouppolyValueController;
  Color? colorPicked1;
  Color? colorPicked2;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (Add Geofence List  circle)] action in Container widget.
  ApiCallResponse? addGeofenceResult;
  // Stores action output result for [Backend Call - API (Add Geofence List  polygon)] action in Container widget.
  ApiCallResponse? polygonresult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    namepolyFocusNode?.dispose();
    namepolyTextController?.dispose();
  }
}
