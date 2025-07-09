import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_sim_widget.dart' show AddSimWidget;
import 'package:flutter/material.dart';

class AddSimModel extends FlutterFlowModel<AddSimWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  var barCodeValueOptions = '';
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r6xfivd2' /* simNumber is required */,
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
