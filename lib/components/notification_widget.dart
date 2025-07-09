import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final deviceList = functions
              .searchDevices(
                  getJsonField(
                    FFAppState().userSelfData,
                    r'''$.devices''',
                  ),
                  'test')
              .toList();

          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: deviceList.length,
            itemBuilder: (context, deviceListIndex) {
              final deviceListItem = deviceList[deviceListIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 32.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      getJsonField(
                        deviceListItem,
                        r'''$.device.name''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
