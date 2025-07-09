import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bbb_model.dart';
export 'bbb_model.dart';

class BbbWidget extends StatefulWidget {
  const BbbWidget({super.key});

  @override
  State<BbbWidget> createState() => _BbbWidgetState();
}

class _BbbWidgetState extends State<BbbWidget> {
  late BbbModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BbbModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: FlutterFlowCreditCardForm(
        formKey: _model.creditCardFormKey,
        creditCardModel: _model.creditCardInfo,
        obscureNumber: true,
        obscureCvv: false,
        spacing: 10.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'arial',
              letterSpacing: 0.0,
            ),
        inputDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
