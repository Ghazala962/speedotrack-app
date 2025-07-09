import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'boxshadow_model.dart';
export 'boxshadow_model.dart';

class BoxshadowWidget extends StatefulWidget {
  const BoxshadowWidget({super.key});

  @override
  State<BoxshadowWidget> createState() => _BoxshadowWidgetState();
}

class _BoxshadowWidgetState extends State<BoxshadowWidget> {
  late BoxshadowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoxshadowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x00FFFFFF),
            FlutterFlowTheme.of(context).secondaryBackground
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 64.0, 24.0, 24.0),
        child: Text(
          FFLocalizations.of(context).getText(
            '8f4b69y8' /* Join us & cook with confidence */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).displayMedium.override(
                fontFamily: 'arial',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
