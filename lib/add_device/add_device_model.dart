import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_device_widget.dart' show AddDeviceWidget;
import 'package:flutter/material.dart';

class AddDeviceModel extends FlutterFlowModel<AddDeviceWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  var barCodeValue = '';
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4vmwpwer' /* deviceImei is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
