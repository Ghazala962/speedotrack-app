import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_list_widget.dart' show EventListWidget;
import 'package:flutter/material.dart';

class EventListModel extends FlutterFlowModel<EventListWidget> {
  ///  Local state fields for this page.

  dynamic vehiclesListData;

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
