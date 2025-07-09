import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_geofence_widget.dart' show EditGeofenceWidget;
import 'package:flutter/material.dart';

class EditGeofenceModel extends FlutterFlowModel<EditGeofenceWidget> {
  ///  Local state fields for this page.

  bool isLoadingGeneralInfo = true;

  dynamic liveVehicleTrackingData;

  bool showCard = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
  // State field(s) for group widget.
  String? groupValue1;
  FormFieldController<String>? groupValueController1;
  // State field(s) for group widget.
  String? groupValue2;
  FormFieldController<String>? groupValueController2;
  Color? colorPicked;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (Edit Geofence Api circle)] action in Container widget.
  ApiCallResponse? editGeofenceCircle;
  // Stores action output result for [Backend Call - API (Edit Geofence Api  polygon)] action in Container widget.
  ApiCallResponse? editGeofencepolygon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();
  }
}
