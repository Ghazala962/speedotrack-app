import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'm_y_devices_widget.dart' show MYDevicesWidget;
import 'package:flutter/material.dart';

class MYDevicesModel extends FlutterFlowModel<MYDevicesWidget> {
  ///  Local state fields for this page.

  bool? showSearch = false;

  String? searchValue;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
