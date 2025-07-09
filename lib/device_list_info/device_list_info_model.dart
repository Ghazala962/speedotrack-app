import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'device_list_info_widget.dart' show DeviceListInfoWidget;
import 'package:flutter/material.dart';

class DeviceListInfoModel extends FlutterFlowModel<DeviceListInfoWidget> {
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
