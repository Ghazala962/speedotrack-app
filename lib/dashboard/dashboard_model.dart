import '/backend/api_requests/api_calls.dart';
import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  String? startDate;

  String? endDate;

  String? selectedDevice;

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

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
