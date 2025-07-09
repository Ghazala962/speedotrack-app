import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'report_screen_widget.dart' show ReportScreenWidget;
import 'package:flutter/material.dart';

class ReportScreenModel extends FlutterFlowModel<ReportScreenWidget> {
  ///  Local state fields for this page.

  List<String> selectedDevices = [];
  void addToSelectedDevices(String item) => selectedDevices.add(item);
  void removeFromSelectedDevices(String item) => selectedDevices.remove(item);
  void removeAtIndexFromSelectedDevices(int index) =>
      selectedDevices.removeAt(index);
  void insertAtIndexInSelectedDevices(int index, String item) =>
      selectedDevices.insert(index, item);
  void updateSelectedDevicesAtIndex(int index, Function(String) updateFn) =>
      selectedDevices[index] = updateFn(selectedDevices[index]);

  String? startDate;

  String? endDate;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ReportType widget.
  String? reportTypeValue;
  FormFieldController<String>? reportTypeValueController;
  // State field(s) for DeviceImei widget.
  String? deviceImeiValue;
  FormFieldController<String>? deviceImeiValueController;
  // State field(s) for sensor widget.
  String? sensorValue;
  FormFieldController<String>? sensorValueController;
  // State field(s) for filter widget.
  String? filterValue;
  FormFieldController<String>? filterValueController;
  // Stores action output result for [Backend Call - API (Report PDF Api)] action in Button widget.
  ApiCallResponse? pdfReport;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
