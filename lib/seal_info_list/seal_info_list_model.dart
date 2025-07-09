import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'seal_info_list_widget.dart' show SealInfoListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SealInfoListModel extends FlutterFlowModel<SealInfoListWidget> {
  ///  Local state fields for this page.

  String? searchVal;

  int? pageNo;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData2v4 = false;
  FFUploadedFile uploadedLocalFile_uploadData2v4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Post Bulk Seal Api)] action in Button widget.
  ApiCallResponse? apiResulthom;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController2?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController2?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetSealApiPage2);
  }

  void listViewGetSealApiPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker).then((listViewGetSealApiResponse) {
        final pageItems = (getJsonField(
                  listViewGetSealApiResponse.jsonBody,
                  r'''$.result''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetSealApiResponse,
                )
              : null,
        );
      });
}
