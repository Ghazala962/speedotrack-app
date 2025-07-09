import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_p_o_i_widget.dart' show AddPOIWidget;
import 'package:flutter/material.dart';

class AddPOIModel extends FlutterFlowModel<AddPOIWidget> {
  ///  Local state fields for this page.

  bool isLoadingGeneralInfo = true;

  dynamic liveVehicleTrackingData;

  bool showCard = true;

  FFUploadedFile? file;

  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Color? colorPicked;
  bool isDataUploading_uploadDataMarkerIconAdd = false;
  FFUploadedFile uploadedLocalFile_uploadDataMarkerIconAdd =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for visible widget.
  bool? visibleValue;
  // Stores action output result for [Backend Call - API (Add POI Screen)] action in Container widget.
  ApiCallResponse? addPoiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
