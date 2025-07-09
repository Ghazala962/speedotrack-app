import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'import_data_widget.dart' show ImportDataWidget;
import 'package:flutter/material.dart';

class ImportDataModel extends FlutterFlowModel<ImportDataWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataWtz = false;
  FFUploadedFile uploadedLocalFile_uploadDataWtz =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Post Bulk Seal Api)] action in Button widget.
  ApiCallResponse? uploadSealBulk;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
