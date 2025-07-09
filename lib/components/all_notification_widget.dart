import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'all_notification_model.dart';
export 'all_notification_model.dart';

class AllNotificationWidget extends StatefulWidget {
  const AllNotificationWidget({super.key});

  @override
  State<AllNotificationWidget> createState() => _AllNotificationWidgetState();
}

class _AllNotificationWidgetState extends State<AllNotificationWidget> {
  late AllNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllNotificationModel());

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
      width: 307.4,
      height: 193.8,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).textFieldBorderColor,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'kwp9pwob' /* ABC 123 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'arial',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
