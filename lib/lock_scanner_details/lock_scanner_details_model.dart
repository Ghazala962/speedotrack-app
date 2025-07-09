import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lock_scanner_details_widget.dart' show LockScannerDetailsWidget;
import 'package:flutter/material.dart';

class LockScannerDetailsModel
    extends FlutterFlowModel<LockScannerDetailsWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> clickedImages = [];
  void addToClickedImages(FFUploadedFile item) => clickedImages.add(item);
  void removeFromClickedImages(FFUploadedFile item) =>
      clickedImages.remove(item);
  void removeAtIndexFromClickedImages(int index) =>
      clickedImages.removeAt(index);
  void insertAtIndexInClickedImages(int index, FFUploadedFile item) =>
      clickedImages.insert(index, item);
  void updateClickedImagesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      clickedImages[index] = updateFn(clickedImages[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Lock Seal Api)] action in Button widget.
  ApiCallResponse? apiResultxpi;
  bool isDataUploading_clickedToPhotos = false;
  FFUploadedFile uploadedLocalFile_clickedToPhotos =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
