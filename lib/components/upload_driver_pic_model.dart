import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upload_driver_pic_widget.dart' show UploadDriverPicWidget;
import 'package:flutter/material.dart';

class UploadDriverPicModel extends FlutterFlowModel<UploadDriverPicWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Trip Tracking)] action in Container widget.
  ApiCallResponse? tripTracking;
  bool isDataUploading_uploadDataJ4v = false;
  FFUploadedFile uploadedLocalFile_uploadDataJ4v =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataPiu = false;
  FFUploadedFile uploadedLocalFile_uploadDataPiu =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
