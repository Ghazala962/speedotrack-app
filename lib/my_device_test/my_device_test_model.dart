import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_device_test_widget.dart' show MyDeviceTestWidget;
import 'package:flutter/material.dart';

class MyDeviceTestModel extends FlutterFlowModel<MyDeviceTestWidget> {
  ///  Local state fields for this page.

  bool? showSearch = false;

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
