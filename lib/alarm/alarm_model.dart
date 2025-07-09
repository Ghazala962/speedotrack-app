import '/backend/api_requests/api_calls.dart';
import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'alarm_widget.dart' show AlarmWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AlarmModel extends FlutterFlowModel<AlarmWidget> {
  ///  Local state fields for this page.

  int pageNo = 1;

  String? startDate = '';

  String? endDate = '';

  bool showSearchValue = true;

  String? searchValue;

  bool showSearchOptions = true;

  String? selectedDeviceImei;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchVehicle widget.
  FocusNode? searchVehicleFocusNode;
  TextEditingController? searchVehicleTextController;
  String? Function(BuildContext, String?)? searchVehicleTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for DrawerComponent component.
  late DrawerComponentModel drawerComponentModel;

  @override
  void initState(BuildContext context) {
    drawerComponentModel = createModel(context, () => DrawerComponentModel());
  }

  @override
  void dispose() {
    searchVehicleFocusNode?.dispose();
    searchVehicleTextController?.dispose();

    drawerComponentModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
