import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notificationlist_model.dart';
export 'notificationlist_model.dart';

class NotificationlistWidget extends StatefulWidget {
  const NotificationlistWidget({
    super.key,
    this.parameter1,
  });

  final bool? parameter1;

  @override
  State<NotificationlistWidget> createState() => _NotificationlistWidgetState();
}

class _NotificationlistWidgetState extends State<NotificationlistWidget> {
  late NotificationlistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationlistModel());

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

    return Visibility(
      visible: widget.parameter1 ?? true,
      child: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: Container(
            width: 282.0,
            height: 264.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).textFieldBorderColor,
              ),
            ),
            child: Builder(
              builder: (context) {
                final deviceList = getJsonField(
                  FFAppState().userSelfData,
                  r'''$.devices''',
                ).toList();

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: deviceList.length,
                  itemBuilder: (context, deviceListIndex) {
                    final deviceListItem = deviceList[deviceListIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
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
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
